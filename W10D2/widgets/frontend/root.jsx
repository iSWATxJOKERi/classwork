import React from 'react';
import Clock from './clock.jsx';
import Tabs from './tabs.jsx';
import Weather from './weather.jsx';
import Autocomplete from './autocomplete.jsx';

const titles = [
    { title: '0', content: 'First Tab' },
    { title: '1', content: 'Second Tab' },
    { title: '2', content: 'Third Tab' },
    { title: '', content: '' }
];

const names = [ 'Lana Del Rey', 'A$AP Rocky', 'Sia', 'Lorde', 'Roxette', 'Westlife' ];

function Root() {
    return (
        <div>
            <Clock/>
            <Tabs arr={ titles } />
            <Weather />
            <Autocomplete list={ names } />
        </div>
    )
}

export default Root;
