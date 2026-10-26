import { Link } from 'react-router-dom';
import { Button } from '@/shared/ui/button';
import './cta-banner.css';
export default function CtaBanner() {
  return (
    <div className="container">
      <div className="cta-banner">
        <p className="cta-subtitle text-mono">Have a project in mind?</p>
        <h2 className="cta-title">Let's create something awesome.</h2>
        <Link to="/apply"><Button variant="white">Apply for grant <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M5 12h14M12 5l7 7-7 7"/></svg></Button></Link>
      </div>
    </div>
  );
}
