import * as React from 'react';

const Deck = ({ children }: { children: any }) => (
  <main role="main" className="container">
    {children}
  </main>
);

export default Deck;
