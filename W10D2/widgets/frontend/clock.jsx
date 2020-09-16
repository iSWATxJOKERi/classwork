import React from 'react'

class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = { time: new Date() };
        this.tick = this.tick.bind(this);
        this.id = "";
    }

    render() {
        const time = this.state.time;
        const hours = this.state.time.getHours();
        const minutes = this.state.time.getMinutes();
        const seconds = this.state.time.getSeconds();

        return (
            <>
                <h1 className="title">Clock</h1>
                <div className="clock">
                    <div className="top">
                        <h2>Time</h2>
                        <h2>{ hours.toString() }:{ minutes.toString() }:{ seconds.toString() }</h2>
                    </div>
                    <div className="bottom">
                        <h2>Date</h2>
                        <h2>{ time.toDateString() }</h2>
                    </div>
                </div> 
            </>
        )
    }

    tick() {
        this.setState({ time: new Date() });
    }

    componentDidMount() {
        this.id = setInterval(() => {
            this.tick();
        }, 1000)
    }

    componentWillUnmount() {
        clearInterval(this.id);
    }
}

export default Clock;