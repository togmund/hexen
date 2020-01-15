// Exports a function to update state by way of a reducer
// Given more time, would refactor to an object lookup
// Takes in the current state, and a prescribed modification
// Returns an updated state based on the modification
export default function reducer(state: any, action: any) {
  switch (action.type) {
    case SET_INITIAL:
      return {
        ...state,
        hex_tiles: action.data.hex_tiles,
        tile: action.data.tile
      };
    case SET_CHANNEL:
      return {
        ...state,
        channel: action.channel
      };
    case SET_BOARD:
      return {
        ...state,
        hex_tiles: action.hex_tiles
      };
    case SET_HEX:
      return {
        ...state,
        tile: {
          id: action.tile.id,
          name: action.tile.name,
          q: action.tile.q,
          r: action.tile.r,
          s: action.tile.s,
          structure: action.tile.structure,
          region_name: action.tile.name,
          biome_name: action.tile.name,
          resource: action.tile.resource,
          image: action.tile.image
        }
      };
    case NEW_HEX:
      return {
        ...state,
        tile: {
          id: action.id
        }
      };
    case SET_HAND:
      return {
        ...state,
        hand: action.hand,
        selected_card: null,
        target_hex: null,
        target_user: null,
        player: action.player
      };

    case SET_QUESTS:
      return {
        ...state,
        quest_hexes: action.quests
      };
    case DECK_CARD_SELECTED:
      return {
        ...state,
        selected_card: action.deck_card
      };
    case HEX_SELECTED:
      return {
        ...state,
        target_hex: action.target_hex
      };

    case USER_SELECTED:
      return {
        ...state,
        target_user: action.target_user
      };
    // case SET_BAND: {
    //   return {
    //     ...state,
    //     tile: {
    //       id: action.band.id,
    //       name: action.band.name,
    //       region_id: action.band.sigil
    //     }
    //   };
    // }
    default:
      throw new Error(
        `Tried to reduce with unsupported action type: ${action.type}`
      );
  }
}
export const SET_INITIAL = 'SET_INITIAL';
export const SET_CHANNEL = 'SET_CHANNEL';
export const SET_BOARD = 'SET_BOARD';
export const SET_HEX = 'SET_HEX';
export const SET_HAND = 'SET_HAND';
export const SET_QUESTS = 'SET_QUESTS';
export const NEW_HEX = 'NEW_HEX';

export const DECK_CARD_SELECTED = 'DECK_CARD_SELECTED';
export const HEX_SELECTED = 'HEX_SELECTED';
export const USER_SELECTED = 'USER_SELECTED';
// export const SET_BAND = 'SET_BAND';
