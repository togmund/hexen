import * as React from 'react';

const Main = ({ children }: { children: any }) => (
  <main role="main" className="container">
    {children}
  </main>
);

export default Main;
