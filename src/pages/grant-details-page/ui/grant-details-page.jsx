import { useParams, Link } from 'react-router-dom';
import { Button } from '@/shared/ui/button';
import { GrantCard } from '@/entities/grant-card';
import { grants } from '@/shared/mock/data';
import './grant-details-page.css';

export default function GrantDetailsPage() {
  const { id } = useParams();
  const grant = grants.find(g => g.id === Number(id)) || grants[3];

  return (
    <div className="container page-wrapper">
      <Link to="/grants" className="back-btn">←</Link>
      {grant.image && (
        <div className="grant-cover"><img src={grant.image} alt={grant.title} /></div>
      )}
      <div className="grant-header">
        <div>
          <span className="text-mono text-muted">{grant.category}</span>
          <h1 className="title-h1" style={{ fontSize: '40px', margin: '12px 0' }}>{grant.title}</h1>
          <div className="grant-meta">
            <span className="status-badge text-mono">Funded ✓</span>
            <span className="text-mono text-muted">Funding amount: {grant.amount}</span>
          </div>
        </div>
        <Button>Project link ↗</Button>
      </div>
      <div className="grant-body">
        <div className="grant-text">
          <h3>Description</h3>
          <p className="text-muted">{grant.description}</p>
          <h3>Purpose</h3>
          <p className="text-muted">Funding Rates page will help promote and guide traders around Perpetual premiums found across all assets traded on dYdX.</p>
          <h3>Execution</h3>
          <p className="text-muted">3 months to completion. Estimated to take 120 days, worked on concurrently.</p>
          <h3>Payment structure</h3>
          <p className="text-muted">25% upfront / 75% at completion.</p>
        </div>
        <div className="grant-sidebar">
          <h3>Team</h3>
          <div className="team-chips">
            {grant.team.map((img, i) => (
              <Link to="/grantee/1" key={i} className="team-chip">
                <div className="avatar-sm" style={{ backgroundImage: `url(${img})` }} />
                <span>Jane Cooper</span>
              </Link>
            ))}
          </div>
          <h3 className="mt-60">Funding transactions</h3>
          <div className="funding-box">
            <div className="funding-row"><span className="text-mono">Round 9</span><span className="text-mono">$250,000.00 ↗</span></div>
            <div className="funding-row mt-20"><span className="text-mono">Funding title</span><span className="text-mono">$30,000.00 ↗</span></div>
          </div>
        </div>
      </div>
      <div className="mt-60">
        <h2 className="title-h2 text-center mb-40 mt-60">More grants like this</h2>
        <div className="grid-2"><GrantCard grant={grants[0]} /><GrantCard grant={grants[1]} /></div>
      </div>
    </div>
  );
}
