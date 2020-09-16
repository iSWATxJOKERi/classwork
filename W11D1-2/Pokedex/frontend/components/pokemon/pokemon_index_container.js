import { connect } from 'react-redux';
import { requestAllPokemon, receiveAllPokemon } from '../../actions/pokemon_actions';
import selectAllPokemon from '../../reducers/selectors';

const mapStateToProps = state => ({
    pokemon: receiveAllPokemon(state.entities.pokemon)
});

const mapDispatchToProps = dispatch => ({
    requestAllPokemon: dispatch(requestAllPokemon())
});

connect();