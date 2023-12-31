import Styles from './stylesNotFound.module.css'
import { Link } from 'react-router-dom';

const NotFound = () => {
  return (
    <div className={Styles.container}>
      <h1>404 - Not Found</h1>
      <p>La página que estás buscando no existe.</p>
      <Link to="/home">
        <button className={Styles.buttonInicio}>Volver a la aplicación</button>
      </Link>
    </div>
  );
};

export default NotFound;