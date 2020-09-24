import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import '../../../font_awesome';

class SideBar extends React.Component {
    constructor(props) {
        super(props);

    }

    render() {
        const home = <FontAwesomeIcon icon="home" />
        const trending = <FontAwesomeIcon icon="fire" />
        const subscriptions = <FontAwesomeIcon icon="users" />
        const library = <FontAwesomeIcon icon="photo-video" />
        return (
            <section className="sidebar">
                <section className="sidebar-items">
                    <div className="item home-item">
                        { home }
                        <span>Home</span>
                    </div>
                    <div className="item trending-item">
                        { trending }
                        <span>Trending</span>
                    </div>
                    <div className="item subs-item">
                        { subscriptions }
                        <span>Subscriptions</span>
                    </div>
                    <div className="item library-item">
                        { library }
                        <span>Library</span>
                    </div>
                </section>
            </section>
        )
    }
}

export default SideBar;