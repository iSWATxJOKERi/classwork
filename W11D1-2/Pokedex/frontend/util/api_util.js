export const fetchAllPokemon = () => {
    // debugger
    return $.ajax({
        method: 'GET',
        url: '/api/pokemon'
    });    
};