import Style from './styles.module.css'

interface Props {
  title?: string
  gym_name?: string
  date?: string
  info?: string
}

export default function New({ title, gym_name, date, info }: Props) {
  return (
    <div className={Style.new}>
      <div className={Style.heard}>
        <h2 className={Style.title}>{title}</h2>
        <div className={Style.date}>{date}</div>
      </div>
      <h3>Gimasio: {gym_name}</h3>
      {/*<h6>{date?.toLocaleDateString('es-ES')}</h6>*/}
      <p>{info}</p>
    </div>
  )
}
