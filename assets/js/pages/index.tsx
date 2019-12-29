import * as React from 'react';
import { RouteComponentProps, Link } from 'react-router-dom';
import Main from '../components/Main';

const HomePage: React.FC<RouteComponentProps> = () => (
  <Main>
    <section className="map">
      <h1>Map gossses here</h1>
    </section>
  </Main>
);

export default HomePage;
