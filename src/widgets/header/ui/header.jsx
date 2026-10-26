import { useState } from 'react';
import { Link, useLocation } from 'react-router-dom';
import { Button } from '@/shared/ui/button';
import './header.css';

export default function Header() {
  const [isOpen, setIsOpen] = useState(false);
  const location = useLocation();
  const navItems = [
    { path: '/rfps', label: 'Discover initiatives' },
    { path: '/grants', label: 'Funded grants' },
    { path: '/expenses', label: 'Program expenses' },
    { path: '/blog', label: 'Blog' },
    { path: '/faq', label: 'FAQ' },
  ];

  return (
    <header className="header">
      <div className="container header-container">
        <Link to="/" className="logo" onClick={() => setIsOpen(false)}>
          {/* Если логотипа нет, покажет текст */}
          <img src="/logo.png" alt="dYdX grants" className="logo-img" onError={(e) => { e.target.style.display='none'; e.target.nextSibling.style.display='flex'; }} />
          <span className="logo-text" style={{display: 'none'}}>dYdX<span>grants</span></span>
        </Link>
        
        <nav className={`nav ${isOpen ? 'open' : ''}`}>
          <ul className="nav-list">
            {navItems.map((item) => (
              <li key={item.path}>
                <Link to={item.path} className={`nav-link ${location.pathname === item.path ? 'active' : ''}`} onClick={() => setIsOpen(false)}>{item.label}</Link>
              </li>
            ))}
          </ul>
        </nav>
        
        <div className="header-actions">
          <Link to="/apply" className="desktop-apply"><Button>Apply for grant</Button></Link>
          {/* Бургер на чистом CSS */}
          <button className={`burger ${isOpen ? 'active' : ''}`} onClick={() => setIsOpen(!isOpen)}>
            <span></span><span></span><span></span>
          </button>
        </div>
      </div>
      {/* Мобильное меню */}
      <div className={`mobile-menu ${isOpen ? 'open' : ''}`}>
        {navItems.map((item) => (
          <Link key={item.path} to={item.path} className="mobile-link" onClick={() => setIsOpen(false)}>{item.label}</Link>
        ))}
        <Link to="/apply" className="mobile-apply" onClick={() => setIsOpen(false)}><Button>Apply for grant</Button></Link>
      </div>
    </header>
  );
}
