import { Link } from 'react-router-dom';
import { GrantCard } from '@/entities/grant-card';
import { grants } from '@/shared/mock/data';
import './grantee-page.css';

export default function GranteePage() {
  return (
    <div className="container page-wrapper">
      <Link to="/grants" className="back-btn">←</Link>
      <div className="text-center mb-40">
        <div className="profile-avatar" />
        <h1 className="title-h1">Jane Cooper</h1>
      </div>
      <div className="profile-content">
        <h3>About</h3>
        <p className="text-muted">For centuries, high-altitude producers had two contradictory effects on performance. For explosive events (sprints) the reduction in atmospheric pressure means there is less resistance.</p>
        <h3 className="mt-60">Links</h3>
        <div className="links-chips">
          <a href="#" className="chip">Twitter</a>
          <a href="#" className="chip">LinkedIn</a>
          <a href="#" className="chip">Github</a>
        </div>
      </div>
      <h2 className="title-h2 text-center mt-60 mb-40">Projects</h2>
      <div className="grid-2"><GrantCard grant={grants[0]} /><GrantCard grant={grants[1]} /></div>
    </div>
  );
}
