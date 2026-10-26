import { Link } from 'react-router-dom';
import { GrantCard } from '@/entities/grant-card';
import { grants } from '@/shared/mock/data';
import './blog-post-page.css';

export default function BlogPostPage() {
  return (
    <div className="container page-wrapper" style={{ maxWidth: '900px' }}>
      <Link to="/blog" className="back-btn">←</Link>
      <div className="text-center mb-40">
        <span className="text-mono text-muted">Funding round</span>
        <h1 className="title-h1">Round 9 of approvals</h1>
        <span className="author-chip text-mono">By dYdX Grants Team</span>
      </div>
      <div className="post-cover"><h2>Round 9 of approvals</h2></div>
      <div className="post-content">
        <p className="text-muted">Hi Everyone!</p>
        <p className="text-muted">Excited to share another round of funding approved by the Committee! For Round 6, we have 5 grantees with a total of $246,000.00 in DYDX funding.</p>
        <h3>Centralization lets you make decisions quickly</h3>
        <p className="text-muted">We're also happy to share that the Committee revamp is close to getting finalized. This revamp will enable payments to be complete by the Grants multisig.</p>
        <blockquote>"The more realistic an experience we provide, the more real feedback we can get." — Creighton Abrams</blockquote>
      </div>
      <div className="mt-60">
        <h2 className="title-h2 text-center mb-40 mt-60">Funded grants</h2>
        <div className="grid-2"><GrantCard grant={grants[0]} /><GrantCard grant={grants[1]} /></div>
      </div>
    </div>
  );
}
