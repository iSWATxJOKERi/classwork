class FollowToggle {
    constructor(el) {
        this.$el = $(el)
        this.userId = this.$el.data("user-id");
        this.followState = this.$el.data("initial-follow-state");
        this.render();
        // debugger
        this.handleClick();
    }    

    render() {
        if(this.followState === "unfollowed") {
            this.$el.text('Follow!');
        }else if (this.followState === "followed") {
            this.$el.text('Unfollow!');
        }
    }

    handleClick() {
        // debugger
        let that = this;
        (this.$el).on('click', function(e) {
            e.preventDefault();
            let follower = window.location.pathname;
            let link = follower.split("/");
            // debugger
            if(that.followState === "unfollowed") {
                // debugger
                return $.ajax({
                    method: "POST",
                    dataType: "json",
                    url: `/users/${link[link.length - 1]}/follow`,
                    success: function() {
                        that.followState = "followed";
                        that.render();
                    }
                })
            }else {
                // debugger
                return $.ajax({
                    method: "DELETE",
                    dataType: "json",
                    url: `/users/${link[link.length - 1]}/follow`,
                    success: function() {
                        that.followState = "unfollowed";
                        that.render();
                    }
                })
            }
        }) 
    }
}


module.exports = FollowToggle;


