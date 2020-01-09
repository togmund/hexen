import { useReducer, useEffect } from 'react';

import reducer, { SET_HEX, SET_HAND, SET_BAND } from '../reducers/application';

export default function useApplicationData() {
  const [state, dispatch] = useReducer(reducer, {
    id: 1,
    name: 'hex:1',
    tile: {
      id: 1,
      name: 'FezJab',
      region_id: 1,
      resource: 'Silver',
      structure: null
    },
    players: [
      {
        deck: 1,
        hand: [],
        player: 1
      }
    ],
    band: {
      id: null,
      name: null,
      sigil: null
    }
  });

  const refreshState = () => {
    dispatch({
      type: SET_HEX,
      days: response[0].data,
      appointments: response[1].data,
      interviewers: response[2].data
    });
  };

  useEffect(() => {
    refreshState();
  }, []);

  const stateObject = {
    state: state,

    setDay: function setDay() {
      dispatch({ type: SET_DAY, day: day });
    },

    bookInterview: function bookInterview() {
      dispatch({
        type: SET_INTERVIEW,
        appointments: appointments,
        days: days
      });
    },
    cancelInterview: function cancelInterview() {
      dispatch({
        type: SET_INTERVIEW,
        appointments: appointments,
        days: days
      });
    }
  };
  return stateObject;
}
