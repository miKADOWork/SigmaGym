import './App.css'
import { Routes, Route } from "react-router-dom"
import Home from './pages/Home';
import Login from './pages/Login';
import Layout from './Layout';
import Registration from './pages/Registration';
import Plans from './pages/Plans';

const App = () => {
  // IMPLEMENTAR AQUÍ LA LOGICA

  return (
    <div>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route path="" element={<Home />} />
          <Route path="/plans" element={<Plans />} />
        </Route>
        <Route path='/login' element={<Login />} />
        <Route path='/registration' element={<Registration />} />
      </Routes>
    </div>
  );
};

export default App;