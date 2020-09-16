import React from 'react';

class Weather extends React.Component {
    constructor() {
        super();
        this.state = { temperature: "", city: "" };
        this.requester = this.requester.bind(this);
        // debugger
    }


    componentDidMount() {
        // debugger
        navigator.geolocation.getCurrentPosition(this.requester);
    }

    requester(location) {
        let that = this;
        // debugger
        let lat = location.coords.latitude;
        let lon = location.coords.longitude;
        let apikey = 'cd99afb37bd7a7a478aa51e5cf935ea4';
        let request = new XMLHttpRequest();
        request.open('GET', `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${apikey}`, true);

        request.onload = function() {
            if(this.status === 200) {
                let response = JSON.parse(this.responseText);
                console.log(response);
                that.setState({ 
                    temperature: response.main.temp,
                    city: response.name
                })
            }else {
                console.log("error");
            }
        }

        request.send();
    }

    render() {
        return (
            <>
                <h1>Weather</h1>
                <div className="weather">
                    <div className="temp">
                        <h2>Temperature</h2>
                        <h2>{ Math.floor((this.state.temperature * (9/5)) - 459.67)} F</h2>
                    </div>
                    <div className="city">
                        <h2>City</h2>
                        <h2>{ this.state.city }</h2>
                    </div>
                </div>
            </>
        )
    }
    
}

export default Weather;