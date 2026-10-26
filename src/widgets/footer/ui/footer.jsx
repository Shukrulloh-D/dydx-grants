import { Link } from 'react-router-dom';
import './footer.css';
export default function Footer() {
  return (
    <footer className="footer">
      <div className="container footer-container">
        <div className="footer-left">
          <span className="footer-logo">dYdX</span>
          <Link to="/faq">About</Link>
          <Link to="/faq">FAQ</Link>
          <Link to="/brand-assets">Brand assets</Link>
          <a href="https://dydx.foundation" target="_blank" rel="noreferrer">dYdX Foundation ↗</a>
        </div>
        <div className="footer-right">
          {/* Встроенные иконки */}
          <a href="#" className="social-icon">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M22 4s-.7 2.1-2 3.4c1.6 10-9.4 17.3-18 11.6 2.2.1 4.4-.6 6-2C3 15.5.5 9.6 3 5c2.2 2.6 5.6 4.1 9 4-.9-4.2 4-6.6 7-3.8 1.1 0 3-1.2 3-1.2z"/></svg>
          </a>
          <a href="#" className="social-icon">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20"/><path d="M2 12h20"/></svg>
          </a>
        </div>
      </div>
    </footer>
  );
}
