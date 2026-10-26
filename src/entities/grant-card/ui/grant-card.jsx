import { Link } from 'react-router-dom';
import './grant-card.css';

export default function GrantCard({ grant }) {
  return (
    <Link to={`/grant/${grant.id}`} className="grant-card">
      <div className="grant-card-header">
        <span className="grant-category text-mono text-muted">{grant.category}</span>
        <h3 className="grant-title">{grant.title}</h3>
        <p className="grant-amount text-mono text-muted">Funding amount: {grant.amount}</p>
        <p className="grant-desc">{grant.description}</p>
      </div>
      <div className="grant-card-footer">
        <div className="avatar-group">
          {grant.team.map((img, i) => (
            <div key={i} className="avatar" style={{ backgroundImage: `url(${img})`, zIndex: 10-i }} />
          ))}
        </div>
        <div className="card-arrow">
          {/* Встроенная SVG стрелочка вместо lucide */}
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M7 17l9.2-9.2M17 17V7H7"/></svg>
        </div>
      </div>
    </Link>
  );
}
