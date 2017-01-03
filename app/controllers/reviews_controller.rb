class ReviewsController < ApplicationController
    before_action :find_book
    before_action :find_review, only: [:edit, :update, :destroy]
    before_action :redirect_user, only: [:new, :edit]
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy
    
        def new 
          if current_user 
            @review = Review.where(user_id: current_user.id, movie_id: params[:movie_id]).first_or_initialize 
            if @review.id.present? 
             flash[:success] = "You have already reviewed this Movie.You can edit the review below"
              render 'edit' 
            end 
          end 
        end



        
        
    def create
        @review = Review.new(review_params)
        @review.movie_id = @movie.id
        @review.user_id = current_user.id
        
            if @review.save
                redirect_to movie_path(@movie)
            else
                render 'new'
            end
    end
    
    def edit
    end
    
    def destroy
        @review.destroy
        flash[:success] = "Review deleted"
        redirect_to request.referrer || root_url
    end


    def update
            
            if @review.update(review_params)
                redirect_to movie_path(@movie)
            else
                render 'edit'
            end
    end
    
    
    def upvote
        @review = Review.find(params[:id])
        @review.upvote_by current_user
        redirect_to :back
    end
    
    def downvote
        @review = Review.find(params[:id])
        @review.downvote_by current_user
        redirect_to :back
    end


    private
        
        def review_params
            params.require(:review).permit(:rating, :comment)
        end

        def find_book
            @movie = Movie.find(params[:movie_id])
        end
        
        def find_review
            @review = Review.find(params[:id])
        end
        
        def correct_user
            @review = current_user.reviews.find_by(id: params[:id])
            redirect_to root_url if @review.nil?
        end

end

