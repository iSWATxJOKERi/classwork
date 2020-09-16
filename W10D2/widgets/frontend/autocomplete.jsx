import React from 'react';

class Autocomplete extends React.Component {
    constructor(props) {
        // debugger
        super(props);
        this.arr = this.props.list;
        this.state = { inputVal: "" };
    }

    update() {
        return (e) => {
            this.setState({ inputVal: e.target.value });
        }
    }

    render() {
        const arr = [];
        for( let i = 0; i < this.arr.length; i++ ) {
            arr.push(<li key={i}>{ this.arr[i] }</li>);
        }
        // debugger
        return (
            <>
                <div className="autocomplete">
                    <h1>Autocomplete</h1>
                    <input className="search" type="text" onChange={ this.update() } value={ this.state.inputVal }></input>
                    <ul className="list">
                        { arr }
                    </ul>
                </div>
            </>
        )

    }
}

export default Autocomplete;