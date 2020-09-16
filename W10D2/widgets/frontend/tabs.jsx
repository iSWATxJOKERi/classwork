import React from 'react'

class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.arr = this.props.arr;
        this.state = { selected_tab: 3 }
        this.state["current_tab"] = this.arr[this.state.selected_tab].content;
        this.changeState = this.changeState.bind(this);
    }

    changeState(idx, content) {
        this.setState({ 
            selected_tab: idx,
            current_tab: content 
        });
    }

    render() {
        const array = [];
        for(let i = 0; i < this.arr.length - 1; i++) {
            let content = this.arr[i].content;
            array.push(<h1 key={i} className={this.state.selected_tab === i ? "selected" : ""} onClick={ () => this.changeState(i, content) }>{ this.arr[i].title }</h1>)
        }

        return (
            <>
                <br />
                <div className="tabs">
                    <ul className="titles">
                        { array }
                    </ul>
                    <div className="content">
                        <article> { this.state.current_tab } </article>
                    </div>
                </div>
            </>
        )
    }
}



export default Tabs;