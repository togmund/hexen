import * as React from 'react';

const Deck: React.FC = ({ children }) => (
  <main role="main" className="container">
    {children}
  </main>
);

export default Deck;
