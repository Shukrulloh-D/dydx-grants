#!/bin/bash
echo "🔥 Полная пересборка проекта под Figma..."

# Полностью удаляем старую папку src
rm -rf src

# ==========================================
# 1. СОЗДАНИЕ ПАПОК (FSD)
# ==========================================
mkdir -p src/app/{router,styles,layouts}
mkdir -p src/pages/{home-page,rfps-page,funded-grants-page,grant-details-page,grantee-page,expenses-page,blog-page,blog-post-page,brand-assets-page,apply-page,faq-page}/ui
mkdir -p src/widgets/{header,footer,cta-banner,faq-accordion,process-steps}/ui
mkdir -p src/features/{grant-filter,toggle-completed,blog-load-more}/ui
mkdir -p src/entities/{grant-card,article-card,rfp-row,expense-row}/ui
mkdir -p src/shared/{ui/button,ui/tag,mock}

# ==========================================
# 2. ГЛОБАЛЬНЫЕ СТИЛИ (Сетка, цвета, шрифты)
# ==========================================
cat > src/app/styles/global.css << 'END'
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Space+Mono:wght@400;700&display=swap');

:root {
  --bg-main: #1C1C28;
  --bg-card: #2D2D3D;
  --bg-card-hover: #353545;
  --primary: #6966FF;
  --primary-hover: #5855E0;
  --text-main: #FFFFFF;
  --text-muted: #A0A0B0;
  --success: #10B981;
  --border: #3D3D4D;
  --font-family: 'Inter', sans-serif;
  --font-mono: 'Space Mono', monospace;
}

* { box-sizing: border-box; margin: 0; padding: 0; }

body {
  background-color: var(--bg-main);
  color: var(--text-main);
  font-family: var(--font-family);
  -webkit-font-smoothing: antialiased;
  line-height: 1.5;
  /* Точная сетка как в Figma */
  background-image: 
    linear-gradient(rgba(255, 255, 255, 0.03) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 255, 255, 0.03) 1px, transparent 1px);
  background-size: 40px 40px;
  background-position: center top;
  background-attachment: fixed;
}

a { text-decoration: none; color: inherit; }
ul { list-style: none; }
button { cursor: pointer; font-family: inherit; border: none; background: none; }

/* Контейнер ограничиваем по ширине как в макете */
.container { max-width: 1200px; margin: 0 auto; padding: 0 40px; }

.text-mono { font-family: var(--font-mono); text-transform: uppercase; font-size: 12px; letter-spacing: 1px; }
.title-h1 { font-size: 56px; font-weight: 700; line-height: 1.1; margin-bottom: 24px; letter-spacing: -1px;}
.title-h2 { font-size: 36px; font-weight: 700; margin-bottom: 16px; }
.text-center { text-align: center; }
.mb-40 { margin-bottom: 40px; }
.mt-60 { margin-top: 60px; }
.text-muted { color: var(--text-muted); }

.grid-3 { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; }
.grid-2 { display: grid; grid-template-columns: repeat(2, 1fr); gap: 24px; }

@media (max-width: 992px) {
  .container { padding: 0 20px; }
  .grid-3, .grid-2 { grid-template-columns: 1fr; }
  .title-h1 { font-size: 40px; }
}
END

# ==========================================
# 3. МОКОВЫЕ ДАННЫЕ (Все карточки)
# ==========================================
cat > src/shared/mock/data.js << 'END'
export const grants = [
  { id: 1, category: 'Crowdfund', title: 'Funding rates page', amount: '$5,000 - $6,000', description: 'Grant will be used to build a dedicated web app to give traders a view of all dYdX asset funding rates across multiple timeframes.', team: ['/images/avatar1.png', '/images/avatar2.png'], image: null, isCompleted: false },
  { id: 2, category: 'Edition', title: 'Tradingview integration', amount: '$5,000 - $6,000', description: 'The grant will be used to build a web application that integrates Tradingview strategies into a dYdX Trading account to execute trades directly through a strategy.', team: ['/images/avatar3.png'], image: null, isCompleted: false },
  { id: 3, category: 'Entry', title: 'Rewards optimization research and paper', amount: '$5,000 - $6,000', description: 'The Grant will be used to write a full research report and code samples that will determine optimal trading strategies for rewards maximization.', team: ['/images/avatar1.png', '/images/avatar3.png'], image: null, isCompleted: false },
  { id: 4, category: 'Education', title: 'Youtube dYdX Education Library', amount: '$5,000', description: 'Grant includes work on Funding Rates page, Rewards & Tracking Simulator, and CLI Trading tool.', team: ['/images/avatar2.png'], image: '/images/cover.png', isCompleted: true },
  { id: 5, category: 'Crowdfund', title: 'Hedge banner', amount: '$5,000 - $6,000', description: 'They can be used to defi... the sponsors to the end of the solar system.', team: ['/images/avatar1.png'], image: null, isCompleted: false },
  { id: 6, category: 'Crowdfund', title: 'Hedge educational content', amount: '$5,000 - $6,000', description: 'This proposal is to expand into the emerging world of decentralized finance.', team: ['/images/avatar2.png'], image: null, isCompleted: false },
];

export const rfps = [
  { id: 1, title: 'Funding Rate Page', description: 'Page that provides a live look at all funding rates with popular timeframes in annualized format', amount: '$45,000 - $85,000', status: 'Funded' },
  { id: 2, title: 'CLI Trading Tool', description: 'Self-hosted CLI tool leveraging the dYdX API to allow all functionalities from a terminal', amount: '$25,000 - $40,000', status: 'Funded' },
  { id: 3, title: 'New Language SDKs', description: 'Replicate existing Python SDK to new programming languages with all the same features', amount: '$25,000 - $40,000', status: 'Open' },
  { id: 4, title: 'Liquidation Alert Tool', description: 'Self-hosted tool that alerts the trader of upcoming liquidation prices', amount: '$30,000 - $50,000', status: 'Completed' },
  { id: 5, title: 'Governance Dashboard', description: 'Governance page to promote discussions, proposals, delegation and voting', amount: '$15,000 - $30,000', status: 'Funded' },
  { id: 6, title: 'Delegation Tool', description: 'Webpage to allow active participants to market their voting', amount: '$15,000 - $30,000', status: 'Funded' },
  { id: 7, title: 'Newsletter', description: 'Weekly or Monthly newsletters promoting and educating the dYdX platform', amount: '$10,000 - $20,000', status: 'Funded' },
  { id: 8, title: 'Academy Contributions', description: 'Webpages, Courses, Glossaries and Youtube libraries educating new users', amount: '$10,000 - $25,000', status: 'Funded' },
  { id: 9, title: 'Discord bots', description: 'Additional Discord bots that notify members of activity on dYdX', amount: '$5,000 - $10,000', status: 'Open' },
  { id: 10, title: 'Reward tracking & Simulator', description: 'Page or tool that allows traders to calculate future rewards', amount: '$20,000 - $30,000', status: 'Funded' }
];

export const blogPosts = [
  { id: 1, title: 'Round 9 of approvals', date: 'January 1, 2022', category: 'Funding round' },
  { id: 2, title: 'Round 8 of approvals', date: 'January 1, 2022', category: 'Funding round' },
  { id: 3, title: 'Round 7 of approvals', date: 'January 1, 2022', category: 'Funding round' },
  { id: 4, title: 'Round 6 of approvals', date: 'January 1, 2022', category: 'Funding round' },
  { id: 5, title: 'Round 5 of approvals', date: 'January 1, 2022', category: 'Funding round' },
  { id: 6, title: 'Round 4 of approvals', date: 'January 1, 2022', category: 'Funding round' },
];

export const faqData = [
  { q: 'How do I apply?', a: 'Fill out this application form. The application will only be shared with the Grants lead and members of the committee.' },
  { q: 'Can I apply as a U.S. based person/company?', a: 'Yes, you can apply.' },
  { q: 'How will I be compensated?', a: 'Compensation is in USDC.' },
  { q: 'What type of project will qualify for a Grant?', a: 'Any project that benefits the dYdX ecosystem.' },
  { q: 'What is the application timeline?', a: 'Usually within 2-3 weeks.' },
  { q: 'How can I increase my chances?', a: 'Provide a detailed plan and execution timeline.' },
  { q: 'How often do you approve new Rounds?', a: 'Monthly.' },
];
END

# ==========================================
# 4. SHARED UI (Кнопки и Теги)
# ==========================================
cat > src/shared/ui/button/ui/button.jsx << 'END'
import './button.css';
export const Button = ({ children, variant = 'primary', className = '', ...props }) => {
  return <button className={`btn btn-${variant} ${className}`} {...props}>{children}</button>;
};
END
cat > src/shared/ui/button/ui/button.css << 'END'
.btn { padding: 12px 24px; border-radius: 8px; font-weight: 600; font-size: 14px; transition: all 0.2s ease; display: inline-flex; align-items: center; justify-content: center; gap: 8px; }
.btn-primary { background-color: var(--primary); color: #fff; }
.btn-primary:hover { background-color: var(--primary-hover); transform: translateY(-2px); }
.btn-secondary { background-color: var(--bg-card); color: var(--text-main); border: 1px solid var(--border); }
.btn-secondary:hover { background-color: var(--bg-card-hover); }
.btn-white { background-color: #fff; color: var(--primary); }
.btn-white:hover { background-color: #f0f0f0; transform: translateY(-2px); }
END
echo "export * from './ui/button';" > src/shared/ui/button/index.js

cat > src/shared/ui/tag/ui/tag.jsx << 'END'
import './tag.css';
export const Tag = ({ text, status }) => {
  return <span className={`tag tag-${status.toLowerCase()} text-mono`}>{text}</span>;
};
END
cat > src/shared/ui/tag/ui/tag.css << 'END'
.tag { padding: 6px 16px; border-radius: 20px; font-weight: 600; display: inline-block; }
.tag.funded { background: rgba(255,255,255,0.08); color: #fff; }
.tag.open { background: var(--primary); color: #fff; }
.tag.completed { background: var(--success); color: #fff; }
END
echo "export * from './ui/tag';" > src/shared/ui/tag/index.js

# ==========================================
# 5. ENTITIES (Карточки)
# ==========================================

# Grant Card
cat > src/entities/grant-card/ui/grant-card.jsx << 'END'
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
END
cat > src/entities/grant-card/ui/grant-card.css << 'END'
.grant-card { background: var(--bg-card); border-radius: 16px; padding: 32px; display: flex; flex-direction: column; justify-content: space-between; min-height: 380px; transition: all 0.3s ease; border: 1px solid transparent; }
.grant-card:hover { background: var(--bg-card-hover); border-color: var(--primary); transform: translateY(-4px); }
.grant-category { display: block; margin-bottom: 16px; }
.grant-title { font-size: 22px; margin-bottom: 12px; color: #fff; line-height: 1.3; }
.grant-amount { margin-bottom: 20px; }
.grant-desc { font-size: 14px; color: var(--text-muted); line-height: 1.6; }
.grant-card-footer { display: flex; justify-content: space-between; align-items: center; margin-top: 32px; }
.avatar-group { display: flex; }
.avatar { width: 36px; height: 36px; border-radius: 50%; background: #444; border: 2px solid var(--bg-card); margin-left: -12px; background-size: cover; background-position: center; }
.avatar:first-child { margin-left: 0; }
.card-arrow { color: var(--text-muted); transition: 0.3s; }
.grant-card:hover .card-arrow { color: var(--primary); }
END
echo "export { default as GrantCard } from './ui/grant-card';" > src/entities/grant-card/index.js

# Article Card (Blog)
cat > src/entities/article-card/ui/article-card.jsx << 'END'
import { Link } from 'react-router-dom';
import './article-card.css';

export default function ArticleCard({ post }) {
  return (
    <Link to={`/blog/${post.id}`} className="article-card">
      <div className="article-image-wrapper">
        <div className="article-image-inner">
           <span className="article-category text-mono text-muted">{post.category}</span>
           <h3 className="article-image-title">{post.title}</h3>
        </div>
      </div>
      <div className="article-content">
        <span className="article-category text-mono text-muted">{post.category}</span>
        <h3 className="article-title">{post.title}</h3>
        <span className="article-date text-mono text-muted">{post.date}</span>
      </div>
    </Link>
  );
}
END
cat > src/entities/article-card/ui/article-card.css << 'END'
.article-card { display: flex; flex-direction: column; background: var(--bg-card); border-radius: 16px; overflow: hidden; transition: 0.3s; border: 1px solid transparent; }
.article-card:hover { transform: translateY(-4px); border-color: var(--border); }
.article-image-wrapper { padding: 8px; }
.article-image-inner { height: 220px; background: var(--bg-main); border: 2px solid var(--primary); border-radius: 12px; display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center; padding: 24px; position: relative; overflow: hidden; }
/* Фиолетовая закарючка в углу */
.article-image-inner::after { content: ''; position: absolute; bottom: -2px; right: -2px; width: 32px; height: 32px; background: var(--primary); clip-path: polygon(100% 0, 100% 100%, 0 100%); border-bottom-right-radius: 10px; }
.article-image-title { font-size: 26px; color: #fff; margin-top: 12px; line-height: 1.2; }
.article-content { padding: 24px; }
.article-category { display: block; margin-bottom: 8px; }
.article-title { font-size: 20px; margin-bottom: 20px; }
END
echo "export { default as ArticleCard } from './ui/article-card';" > src/entities/article-card/index.js

# RFP Row
cat > src/entities/rfp-row/ui/rfp-row.jsx << 'END'
import { Tag } from '@/shared/ui/tag';
import './rfp-row.css';
export default function RfpRow({ rfp }) {
  return (
    <div className="rfp-row">
      <div className="rfp-info">
        <h3 className="rfp-title">{rfp.title}</h3>
        <p className="rfp-desc">{rfp.description}</p>
        <p className="rfp-amount text-mono text-muted">Funding amount: {rfp.amount}</p>
      </div>
      <Tag text={rfp.status} status={rfp.status} />
    </div>
  );
}
END
cat > src/entities/rfp-row/ui/rfp-row.css << 'END'
.rfp-row { background: var(--bg-card); padding: 24px 32px; border-radius: 12px; display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px; transition: 0.2s; border: 1px solid transparent;}
.rfp-row:hover { background: var(--bg-card-hover); border-color: var(--border); }
.rfp-title { font-size: 18px; margin-bottom: 8px; }
.rfp-desc { color: var(--text-muted); font-size: 14px; margin-bottom: 12px; max-width: 700px; }
@media (max-width: 768px) { .rfp-row { flex-direction: column; align-items: flex-start; gap: 16px; } }
END
echo "export { default as RfpRow } from './ui/rfp-row';" > src/entities/rfp-row/index.js

# Expense Row
cat > src/entities/expense-row/ui/expense-row.jsx << 'END'
import './expense-row.css';
export default function ExpenseRow({ expense }) {
  return (
    <div className="expense-row">
      <div className="expense-info">
        <h3 className="expense-title">{expense.title}</h3>
        <p className="expense-type text-mono text-muted">{expense.type}</p>
      </div>
      <div className="expense-amount text-mono text-muted">
        {expense.amount} 
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6M15 3h6v6M10 14L21 3"/></svg>
      </div>
    </div>
  );
}
END
cat > src/entities/expense-row/ui/expense-row.css << 'END'
.expense-row { background: var(--bg-card); padding: 20px 32px; border-radius: 12px; display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px; }
.expense-title { font-size: 16px; margin-bottom: 4px; }
.expense-amount { display: flex; align-items: center; gap: 8px; }
END
echo "export { default as ExpenseRow } from './ui/expense-row';" > src/entities/expense-row/index.js

# ==========================================
# 6. FEATURES (Логика)
# ==========================================
cat > src/features/grant-filter/ui/grant-filter.jsx << 'END'
import './grant-filter.css';
export default function GrantFilter({ options, current, onChange }) {
  return (
    <div className="tabs-container">
      {options.map(f => (
        <button key={f} className={`tab-btn text-mono ${current === f ? 'active' : ''}`} onClick={() => onChange(f)}>{f}</button>
      ))}
    </div>
  );
}
END
cat > src/features/grant-filter/ui/grant-filter.css << 'END'
.tabs-container { display: flex; justify-content: center; gap: 12px; margin-bottom: 40px; flex-wrap: wrap; }
.tab-btn { background: var(--bg-card); color: var(--text-muted); padding: 10px 24px; border-radius: 6px; transition: 0.2s; border: 1px solid transparent;}
.tab-btn:hover { background: var(--bg-card-hover); color: #fff; }
.tab-btn.active { background: var(--primary); color: #fff; }
END
echo "export { default as GrantFilter } from './ui/grant-filter';" > src/features/grant-filter/index.js

cat > src/features/toggle-completed/ui/toggle-completed.jsx << 'END'
import './toggle-completed.css';
export default function ToggleCompleted({ checked, onChange, label }) {
  return (
    <div className="toggle-wrapper">
      <label className="toggle">
        <input type="checkbox" checked={checked} onChange={onChange} />
        <span className="slider"></span>
      </label>
      <span className="text-mono text-muted">{label}</span>
    </div>
  );
}
END
cat > src/features/toggle-completed/ui/toggle-completed.css << 'END'
.toggle-wrapper { display: flex; justify-content: flex-start; align-items: center; gap: 16px; margin-bottom: 40px; }
.toggle { position: relative; display: inline-block; width: 44px; height: 24px; }
.toggle input { opacity: 0; width: 0; height: 0; }
.slider { position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0; background-color: var(--bg-card); transition: .4s; border-radius: 24px; border: 1px solid var(--border); }
.slider:before { position: absolute; content: ""; height: 16px; width: 16px; left: 3px; bottom: 3px; background-color: var(--text-muted); transition: .4s; border-radius: 50%; }
input:checked + .slider { background-color: var(--primary); border-color: var(--primary); }
input:checked + .slider:before { transform: translateX(20px); background-color: #fff; }
END
echo "export { default as ToggleCompleted } from './ui/toggle-completed';" > src/features/toggle-completed/index.js

cat > src/features/blog-load-more/ui/blog-load-more.jsx << 'END'
import { Button } from '@/shared/ui/button';
import { useState } from 'react';
export default function BlogLoadMore({ total, initial = 4, step = 2, children }) {
  const [visible, setVisible] = useState(initial);
  const hasMore = visible < total;
  return (
    <div>
      {children(visible)}
      {hasMore && (
        <div className="text-center mt-60">
          <Button variant="secondary" onClick={() => setVisible(v => v + step)}>Load more posts</Button>
        </div>
      )}
    </div>
  );
}
END
echo "export { default as BlogLoadMore } from './ui/blog-load-more';" > src/features/blog-load-more/index.js

# ==========================================
# 7. WIDGETS
# ==========================================

# Header
cat > src/widgets/header/ui/header.jsx << 'END'
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
END
cat > src/widgets/header/ui/header.css << 'END'
.header { position: sticky; top: 0; background: rgba(28, 28, 40, 0.95); backdrop-filter: blur(12px); border-bottom: 1px solid var(--border); z-index: 100; }
.header-container { display: flex; justify-content: space-between; align-items: center; height: 80px; max-width: 1200px; margin: 0 auto; padding: 0 40px; }
.logo { display: flex; align-items: center; }
.logo-img { height: 36px; object-fit: contain; }
.logo-text { flex-direction: column; font-weight: 800; font-size: 24px; line-height: 1; }
.logo-text span { color: var(--primary); font-size: 14px; }
.nav-list { display: flex; gap: 32px; }
.nav-link { color: var(--text-muted); font-size: 14px; font-weight: 500; transition: 0.2s; }
.nav-link:hover, .nav-link.active { color: var(--text-main); }
.header-actions { display: flex; align-items: center; gap: 20px; }
.burger { display: none; flex-direction: column; gap: 5px; z-index: 101;}
.burger span { display: block; width: 24px; height: 2px; background: #fff; transition: 0.3s; }
.burger.active span:nth-child(1) { transform: translateY(7px) rotate(45deg); }
.burger.active span:nth-child(2) { opacity: 0; }
.burger.active span:nth-child(3) { transform: translateY(-7px) rotate(-45deg); }
.mobile-menu { display: none; }
@media (max-width: 992px) {
  .header-container { padding: 0 20px; }
  .nav-list { display: none; }
  .desktop-apply { display: none; }
  .burger { display: flex; }
  .mobile-menu { display: flex; flex-direction: column; position: fixed; top: 80px; left: 0; width: 100%; background: var(--bg-main); padding: 40px 20px; gap: 24px; transform: translateY(-150%); transition: 0.4s; z-index: 99; border-bottom: 1px solid var(--border);}
  .mobile-menu.open { transform: translateY(0); }
  .mobile-link { text-align: center; font-size: 20px; color: var(--text-muted); }
  .mobile-apply { text-align: center; margin-top: 20px; }
}
END
echo "export { default as Header } from './ui/header';" > src/widgets/header/index.js

# Footer
cat > src/widgets/footer/ui/footer.jsx << 'END'
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
END
cat > src/widgets/footer/ui/footer.css << 'END'
.footer { border-top: 1px solid var(--border); padding: 40px 0; margin-top: 80px; background: var(--bg-main); }
.footer-container { display: flex; justify-content: space-between; align-items: center; color: var(--text-muted); font-size: 14px; }
.footer-left, .footer-right { display: flex; gap: 24px; align-items: center; }
.footer-logo { font-weight: 800; color: #fff; font-size: 20px; }
.footer a { transition: color 0.2s; }
.footer a:hover { color: #fff; }
.social-icon { display: flex; align-items: center; justify-content: center; width: 32px; height: 32px; border-radius: 50%; background: var(--bg-card); transition: 0.2s;}
.social-icon:hover { background: var(--primary); color: #fff; }
@media (max-width: 768px) { .footer-container { flex-direction: column; gap: 20px; } .footer-left { flex-wrap: wrap; justify-content: center; } }
END
echo "export { default as Footer } from './ui/footer';" > src/widgets/footer/index.js

# CTA Banner
cat > src/widgets/cta-banner/ui/cta-banner.jsx << 'END'
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
END
cat > src/widgets/cta-banner/ui/cta-banner.css << 'END'
.cta-banner { background: linear-gradient(135deg, #6966FF 0%, #8A87FF 100%); border-radius: 16px; padding: 60px 20px; text-align: center; margin: 80px 0; position: relative; overflow: hidden; }
.cta-banner::before { content: ''; position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-image: linear-gradient(rgba(255,255,255,0.05) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,0.05) 1px, transparent 1px); background-size: 20px 20px; pointer-events: none; }
.cta-subtitle { color: rgba(255,255,255,0.9); margin-bottom: 12px; }
.cta-title { font-size: 36px; margin-bottom: 32px; color: #fff; font-weight: 700; }
END
echo "export { default as CtaBanner } from './ui/cta-banner';" > src/widgets/cta-banner/index.js

# FAQ Accordion
cat > src/widgets/faq-accordion/ui/faq-accordion.jsx << 'END'
import { useState } from 'react';
import './faq-accordion.css';
export default function FaqAccordion({ items }) {
  const [openIndex, setOpenIndex] = useState(null);
  return (
    <div className="faq-accordion">
      {items.map((item, index) => (
        <div key={index} className="faq-item">
          <button className="faq-question" onClick={() => setOpenIndex(openIndex === index ? null : index)}>
            {item.q}
            <span className={`faq-icon ${openIndex === index ? 'open' : ''}`}>
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M12 5v14M5 12h14"/></svg>
            </span>
          </button>
          <div className={`faq-answer-wrapper ${openIndex === index ? 'open' : ''}`}>
            <div className="faq-answer"><p>{item.a}</p></div>
          </div>
        </div>
      ))}
    </div>
  );
}
END
cat > src/widgets/faq-accordion/ui/faq-accordion.css << 'END'
.faq-accordion { max-width: 800px; margin: 0 auto; }
.faq-item { border-bottom: 1px solid var(--border); }
.faq-question { width: 100%; display: flex; justify-content: space-between; align-items: center; padding: 24px 0; color: var(--text-main); font-size: 16px; text-align: left; font-weight: 500; }
.faq-icon { transition: transform 0.3s; color: var(--text-muted); display: flex; }
.faq-icon.open { transform: rotate(45deg); color: var(--primary); }
.faq-answer-wrapper { max-height: 0; overflow: hidden; transition: max-height 0.3s ease; }
.faq-answer-wrapper.open { max-height: 200px; }
.faq-answer { padding-bottom: 24px; color: var(--text-muted); line-height: 1.6; }
END
echo "export { default as FaqAccordion } from './ui/faq-accordion';" > src/widgets/faq-accordion/index.js

# Process Steps (С наклоном и линиями)
cat > src/widgets/process-steps/ui/process-steps.jsx << 'END'
import './process-steps.css';
export default function ProcessSteps() {
  return (
    <div className="process-wrapper">
      <div className="process-steps">
        <div className="step-card step-1">
          <span className="step-num">1</span>
          <h3>Apply</h3>
          <p>Submit a complete application to the dYdX Grants Team including as many details as possible about the proposed idea.</p>
        </div>
        <div className="step-card step-2">
          <span className="step-num">2</span>
          <h3>Interview</h3>
          <p>If selected, the dYdX Grants Team will conduct 1-2 interviews to collect more information on the background.</p>
        </div>
        <div className="step-card step-3">
          <span className="step-num">3</span>
          <h3>Grant offer</h3>
          <p>The dYdX Grants Team will determine if the proposal fits into the grant program. A vesting schedule will be determined.</p>
        </div>
      </div>
    </div>
  );
}
END
cat > src/widgets/process-steps/ui/process-steps.css << 'END'
.process-wrapper { padding: 60px 0; overflow: hidden; }
.process-steps { display: flex; justify-content: center; gap: 0; max-width: 1000px; margin: 0 auto; position: relative; }
.step-card { background: var(--bg-card); padding: 40px 32px; border-radius: 12px; width: 320px; position: relative; border: 1px solid var(--border); transition: 0.3s; }
.step-card:hover { transform: translateY(-5px) rotate(0deg) !important; border-color: var(--primary); z-index: 10; }
/* Точный наклон как в Figma */
.step-1 { transform: rotate(-4deg) translateY(15px); margin-right: -20px; z-index: 1; }
.step-2 { transform: rotate(1.5deg) translateY(-10px); margin-left: -20px; margin-right: -20px; z-index: 2; }
.step-3 { transform: rotate(-2deg) translateY(15px); margin-left: -20px; z-index: 1; }
.step-num { font-size: 60px; font-weight: 800; color: #fff; opacity: 0.05; position: absolute; top: 15px; left: 24px; }
.step-card h3 { margin: 30px 0 12px; font-size: 20px; position: relative; z-index: 2; }
.step-card p { color: var(--text-muted); font-size: 14px; line-height: 1.6; position: relative; z-index: 2;}
@media (max-width: 992px) { .process-steps { flex-direction: column; align-items: center; gap: 24px; } .step-card { transform: none !important; width: 100%; margin: 0 !important; } }
END
echo "export { default as ProcessSteps } from './ui/process-steps';" > src/widgets/process-steps/index.js

# ==========================================
# 8. PAGES
# ==========================================

# --- HOME ---
cat > src/pages/home-page/ui/home-page.jsx << 'END'
import { Link } from 'react-router-dom';
import { Button } from '@/shared/ui/button';
import { GrantCard } from '@/entities/grant-card';
import { ArticleCard } from '@/entities/article-card';
import { FaqAccordion } from '@/widgets/faq-accordion';
import { ProcessSteps } from '@/widgets/process-steps';
import { CtaBanner } from '@/widgets/cta-banner';
import { grants, blogPosts, faqData } from '@/shared/mock/data';
import './home-page.css';

export default function HomePage() {
  return (
    <div>
      <section className="hero container text-center">
        <h1 className="title-h1">Powering the future of<br/>dYdX through<br/>community grants</h1>
        {/* Встроенная SVG закарючка под текстом */}
        <div className="hero-squiggle">
           <svg width="200" height="20" viewBox="0 0 200 20" fill="none"><path d="M5 15C50 5 100 15 195 5" stroke="#6966FF" strokeWidth="3" strokeLinecap="round"/></svg>
        </div>
        <div className="hero-actions">
          <Link to="/rfps"><Button variant="secondary">Discover RFPs</Button></Link>
          <Link to="/apply"><Button>Apply for grant →</Button></Link>
        </div>
        <div className="hero-stats">
          <div className="stat"><h3>100+</h3><p className="text-mono text-muted">projects funded</p></div>
          <div className="stat"><h3>$3+ million</h3><p className="text-mono text-muted">awarded</p></div>
          <div className="stat"><h3>400+</h3><p className="text-mono text-muted">projects funded</p></div>
        </div>
        {/* Большая стрелка вниз */}
        <div className="decor-arrow-down">
          <svg width="24" height="40" viewBox="0 0 24 40" fill="none" stroke="#6966FF" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M12 5v30M5 28l7 7 7-7"/></svg>
        </div>
      </section>

      <section className="section container">
        <div className="text-center mb-40">
          <h2 className="title-h2">Projects built with grants</h2>
          <p className="text-muted mb-20">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
          <Link to="/grants" className="link-primary text-mono">View all funded projects →</Link>
        </div>
        <div className="grid-3">
          {grants.slice(0,3).map(grant => <GrantCard key={grant.id} grant={grant} />)}
        </div>
      </section>

      <section className="section container mt-60">
        <div className="text-center mb-40">
          <h2 className="title-h2">What's new?</h2>
          <p className="text-muted mb-20">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
          <Link to="/blog" className="link-primary text-mono">Read more on our blog →</Link>
        </div>
        <div className="grid-2">
          {blogPosts.slice(0, 2).map(post => <ArticleCard key={post.id} post={post} />)}
        </div>
      </section>

      <section className="section container mt-60">
        <div className="text-center mb-40"><h2 className="title-h2">Frequently asked questions</h2></div>
        <FaqAccordion items={faqData} />
      </section>

      <section className="section container mt-60">
        <div className="text-center mb-40"><h2 className="title-h2">Application process</h2></div>
        <ProcessSteps />
      </section>
      <CtaBanner />
    </div>
  );
}
END
cat > src/pages/home-page/ui/home-page.css << 'END'
.hero { padding: 120px 20px 60px; position: relative; }
.hero-squiggle { margin-bottom: 40px; display: flex; justify-content: center; }
.hero-actions { display: flex; gap: 16px; justify-content: center; margin-bottom: 100px; }
.hero-stats { display: flex; justify-content: center; gap: 100px; }
.stat h3 { font-size: 32px; margin-bottom: 8px; font-weight: 700; }
.decor-arrow-down { margin-top: 80px; animation: bounce 2s infinite; display: flex; justify-content: center; }
@keyframes bounce { 0%, 20%, 50%, 80%, 100% {transform: translateY(0);} 40% {transform: translateY(-15px);} 60% {transform: translateY(-8px);} }
.section { padding-top: 80px; }
.link-primary { color: var(--primary); transition: 0.2s; }
.link-primary:hover { color: #fff; }
.mb-20 { margin-bottom: 20px; }
@media (max-width: 992px) { .hero-stats { flex-direction: column; gap: 40px; } .hero-actions { flex-direction: column; align-items: center; } }
END
echo "export { default as HomePage } from './ui/home-page';" > src/pages/home-page/index.js

# --- RFPS ---
cat > src/pages/rfps-page/ui/rfps-page.jsx << 'END'
import { useState } from 'react';
import { RfpRow } from '@/entities/rfp-row';
import { GrantFilter } from '@/features/grant-filter';
import { CtaBanner } from '@/widgets/cta-banner';
import { rfps } from '@/shared/mock/data';
import './rfps-page.css';

export default function RfpsPage() {
  const [filter, setFilter] = useState('All');
  const filtered = filter === 'All' ? rfps : rfps.filter(r => r.status === filter);

  return (
    <div className="container page-wrapper">
      <div className="text-center mb-40">
        <h1 className="title-h1">Discover initiatives (RFPs)</h1>
        <p className="text-muted">This list includes initial ideas that we think could make excellent Grants.</p>
      </div>
      <GrantFilter options={['All', 'Open', 'Funded', 'Completed']} current={filter} onChange={setFilter} />
      <div className="rfp-list">
        {filtered.length > 0 ? filtered.map(rfp => <RfpRow key={rfp.id} rfp={rfp} />) : <p className="text-center text-muted">No RFPs found.</p>}
      </div>
      <CtaBanner />
    </div>
  );
}
END
cat > src/pages/rfps-page/ui/rfps-page.css << 'END'
.page-wrapper { padding-top: 80px; }
.rfp-list { max-width: 900px; margin: 0 auto; }
END
echo "export { default as RfpsPage } from './ui/rfps-page';" > src/pages/rfps-page/index.js

# --- FUNDED GRANTS ---
cat > src/pages/funded-grants-page/ui/funded-grants-page.jsx << 'END'
import { useState, useMemo } from 'react';
import { GrantCard } from '@/entities/grant-card';
import { GrantFilter } from '@/features/grant-filter';
import { ToggleCompleted } from '@/features/toggle-completed';
import { CtaBanner } from '@/widgets/cta-banner';
import { grants } from '@/shared/mock/data';
import './funded-grants-page.css';

export default function FundedGrantsPage() {
  const [showCompleted, setShowCompleted] = useState(false);
  const [filter, setFilter] = useState('All');

  const filteredGrants = useMemo(() => {
    return grants.filter(g => {
      const matchStatus = showCompleted ? g.isCompleted : true;
      const matchCategory = filter === 'All' ? true : g.category === filter;
      return matchStatus && matchCategory;
    });
  }, [showCompleted, filter]);

  return (
    <div className="container page-wrapper">
      <div className="text-center mb-40"><h1 className="title-h1">Funded grants</h1></div>
      <GrantFilter options={['All', 'Crowdfund', 'Edition', 'Entry', 'Education']} current={filter} onChange={setFilter} />
      <ToggleCompleted checked={showCompleted} onChange={() => setShowCompleted(!showCompleted)} label="Show only completed" />
      <div className="grid-3">
        {filteredGrants.length > 0 ? filteredGrants.map(grant => <GrantCard key={grant.id} grant={grant} />) : <p className="text-muted text-center" style={{gridColumn: '1 / -1'}}>No grants match your criteria.</p>}
      </div>
      <CtaBanner />
    </div>
  );
}
END
cat > src/pages/funded-grants-page/ui/funded-grants-page.css << 'END'
.page-wrapper { padding-top: 80px; }
END
echo "export { default as FundedGrantsPage } from './ui/funded-grants-page';" > src/pages/funded-grants-page/index.js

# --- GRANT DETAILS ---
cat > src/pages/grant-details-page/ui/grant-details-page.jsx << 'END'
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
END
cat > src/pages/grant-details-page/ui/grant-details-page.css << 'END'
.page-wrapper { padding-top: 40px; max-width: 1000px; margin: 0 auto; }
.back-btn { display: inline-flex; align-items: center; justify-content: center; width: 40px; height: 40px; background: var(--bg-card); border-radius: 50%; margin-bottom: 32px; color: #fff; transition: 0.2s;}
.back-btn:hover { background: var(--primary); }
.grant-cover { width: 100%; height: 350px; border-radius: 16px; overflow: hidden; margin-bottom: 40px; border: 2px solid var(--primary); }
.grant-cover img { width: 100%; height: 100%; object-fit: cover; }
.grant-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 40px; }
.status-badge { background: var(--success); padding: 4px 12px; border-radius: 20px; font-weight: 600; }
.grant-meta { display: flex; gap: 20px; align-items: center; }
.grant-body { display: grid; grid-template-columns: 2fr 1fr; gap: 60px; }
.grant-text h3 { margin: 32px 0 12px; font-size: 20px; }
.grant-text h3:first-child { margin-top: 0; }
.grant-text p { line-height: 1.8; font-size: 15px;}
.team-chips { display: flex; flex-direction: column; gap: 12px; margin-top: 16px; }
.team-chip { display: flex; align-items: center; gap: 10px; background: var(--bg-card); padding: 8px 16px; border-radius: 24px; width: max-content; transition: 0.2s; }
.team-chip:hover { background: var(--primary); }
.avatar-sm { width: 28px; height: 28px; border-radius: 50%; background: #444; background-size: cover; }
.funding-box { background: var(--bg-card); padding: 20px; border-radius: 12px; margin-top: 16px; border: 1px solid var(--border);}
.funding-row { display: flex; justify-content: space-between; }
.mt-20 { margin-top: 16px; }
@media (max-width: 768px) { .grant-header { flex-direction: column; gap: 20px; } .grant-body { grid-template-columns: 1fr; gap: 40px; } }
END
echo "export { default as GrantDetailsPage } from './ui/grant-details-page';" > src/pages/grant-details-page/index.js

# --- GRANTEE ---
cat > src/pages/grantee-page/ui/grantee-page.jsx << 'END'
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
END
cat > src/pages/grantee-page/ui/grantee-page.css << 'END'
.page-wrapper { padding-top: 40px; max-width: 1000px; margin: 0 auto; }
.back-btn { display: inline-flex; align-items: center; justify-content: center; width: 40px; height: 40px; background: var(--bg-card); border-radius: 50%; margin-bottom: 32px; color: #fff;}
.back-btn:hover { background: var(--primary); }
.profile-avatar { width: 120px; height: 120px; border-radius: 50%; background: #444; margin: 0 auto 24px; border: 4px solid var(--bg-card); }
.profile-content { max-width: 800px; margin: 0 auto; }
.profile-content h3 { margin-bottom: 16px; font-size: 20px; }
.profile-content p { line-height: 1.8; font-size: 15px;}
.links-chips { display: flex; gap: 12px; margin-top: 16px; flex-wrap: wrap;}
.chip { background: var(--bg-card); padding: 8px 20px; border-radius: 24px; font-size: 14px; font-weight: 500; display: flex; align-items: center; }
END
echo "export { default as GranteePage } from './ui/grantee-page';" > src/pages/grantee-page/index.js

# --- EXPENSES ---
cat > src/pages/expenses-page/ui/expenses-page.jsx << 'END'
import { ExpenseRow } from '@/entities/expense-row';
import { GrantFilter } from '@/features/grant-filter';
import './expenses-page.css';

const mockExpenses = [
  { id: 1, title: 'Airtable Yearly Subscription', type: 'Vendor', amount: '$850.00' },
  { id: 2, title: 'Expense title', type: 'Type', amount: '-$1,100.37 USDC' },
  { id: 3, title: 'Expense title', type: 'Type', amount: '-$1,100.37 USDC' },
  { id: 4, title: 'Expense title', type: 'Type', amount: '-$1,100.37 USDC' },
];

export default function ExpensesPage() {
  return (
    <div className="container page-wrapper">
      <div className="text-center mb-40"><h1 className="title-h1">Program expenses</h1></div>
      <GrantFilter options={['All', 'Vendor', 'Salary', 'Software']} current="All" onChange={() => {}} />
      <div className="expense-list">
        {mockExpenses.map(e => <ExpenseRow key={e.id} expense={e} />)}
      </div>
    </div>
  );
}
END
cat > src/pages/expenses-page/ui/expenses-page.css << 'END'
.page-wrapper { padding-top: 80px; max-width: 1000px; margin: 0 auto; }
.expense-list { max-width: 800px; margin: 0 auto; }
END
echo "export { default as ExpensesPage } from './ui/expenses-page';" > src/pages/expenses-page/index.js

# --- BLOG ---
cat > src/pages/blog-page/ui/blog-page.jsx << 'END'
import { ArticleCard } from '@/entities/article-card';
import { BlogLoadMore } from '@/features/blog-load-more';
import { GrantFilter } from '@/features/grant-filter';
import { blogPosts } from '@/shared/mock/data';
import './blog-page.css';

export default function BlogPage() {
  return (
    <div className="container page-wrapper">
      <div className="text-center mb-40"><h1 className="title-h1">Blog</h1></div>
      <GrantFilter options={['Latest', 'Funding round', 'Spotlight', 'News']} current="Latest" onChange={() => {}} />
      <div className="grid-2">
        <BlogLoadMore total={blogPosts.length} initial={4} step={2}>
          {(visible) => blogPosts.slice(0, visible).map(post => <ArticleCard key={post.id} post={post} />)}
        </BlogLoadMore>
      </div>
    </div>
  );
}
END
cat > src/pages/blog-page/ui/blog-page.css << 'END'
.page-wrapper { padding-top: 80px; max-width: 1000px; margin: 0 auto; }
END
echo "export { default as BlogPage } from './ui/blog-page';" > src/pages/blog-page/index.js

# --- BLOG POST ---
cat > src/pages/blog-post-page/ui/blog-post-page.jsx << 'END'
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
END
cat > src/pages/blog-post-page/ui/blog-post-page.css << 'END'
.page-wrapper { padding-top: 40px; max-width: 1000px; margin: 0 auto; }
.back-btn { display: inline-flex; align-items: center; justify-content: center; width: 40px; height: 40px; background: var(--bg-card); border-radius: 50%; margin-bottom: 32px; color: #fff;}
.back-btn:hover { background: var(--primary); }
.author-chip { background: var(--bg-card); padding: 6px 16px; border-radius: 20px; display: inline-block; margin-top: 16px; border: 1px solid var(--border);}
.post-cover { width: 100%; height: 300px; background: var(--bg-main); border: 2px solid var(--primary); border-radius: 16px; display: flex; align-items: center; justify-content: center; margin-bottom: 40px; position: relative; }
.post-cover::after { content: ''; position: absolute; bottom: -2px; right: -2px; width: 40px; height: 40px; background: var(--primary); clip-path: polygon(100% 0, 100% 100%, 0 100%); border-bottom-right-radius: 14px; }
.post-cover h2 { font-size: 40px; }
.post-content p { margin-bottom: 20px; line-height: 1.8; font-size: 15px;}
.post-content h3 { color: #fff; margin: 32px 0 16px; font-size: 22px; }
blockquote { border-left: 4px solid var(--primary); padding-left: 20px; margin: 32px 0; font-style: italic; color: var(--text-muted); background: rgba(105, 102, 255, 0.05); padding: 16px 16px 16px 20px; border-radius: 0 8px 8px 0;}
END
echo "export { default as BlogPostPage } from './ui/blog-post-page';" > src/pages/blog-post-page/index.js

# --- BRAND ASSETS ---
cat > src/pages/brand-assets-page/ui/brand-assets-page.jsx << 'END'
import './brand-assets-page.css';

export default function BrandAssetsPage() {
  return (
    <div className="container page-wrapper text-center">
      <h1 className="title-h1">Brand assets</h1>
      <p className="text-muted mb-40">If you are looking to use the dYdX Grants brand, please use the below logos.</p>
      <h2 className="title-h2 mb-40 mt-60">Logo</h2>
      <div className="brand-grid">
        <div className="brand-card dark"><span>dYdX grants</span><button className="download-btn">↓</button></div>
        <div className="brand-card light"><span>dYdX grants</span><button className="download-btn">↓</button></div>
        <div className="brand-card dark"><span>dYdX grants</span><button className="download-btn">↓</button></div>
        <div className="brand-card light"><span>dYdX grants</span><button className="download-btn">↓</button></div>
      </div>
      <h2 className="title-h2 mb-40 mt-60">Avatar</h2>
      <div className="avatar-grid">
        <div className="avatar-card light">X<button className="download-btn">↓</button></div>
        <div className="avatar-card dark">X<button className="download-btn">↓</button></div>
        <div className="avatar-card dark">X<button className="download-btn">↓</button></div>
      </div>
    </div>
  );
}
END
cat > src/pages/brand-assets-page/ui/brand-assets-page.css << 'END'
.page-wrapper { padding-top: 80px; max-width: 1000px; margin: 0 auto; }
.brand-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; max-width: 800px; margin: 0 auto; }
.brand-card { height: 200px; border-radius: 16px; display: flex; align-items: center; justify-content: center; position: relative; font-size: 28px; font-weight: 700; }
.brand-card.dark { background: var(--bg-card); color: #fff; }
.brand-card.light { background: #fff; color: #000; }
.download-btn { position: absolute; top: 16px; right: 16px; background: rgba(0,0,0,0.1); border: none; width: 32px; height: 32px; border-radius: 50%; font-size: 16px; cursor: pointer;}
.brand-card.light .download-btn { background: #eee; }
.avatar-grid { display: flex; justify-content: center; gap: 24px; }
.avatar-card { width: 120px; height: 120px; border-radius: 24px; display: flex; align-items: center; justify-content: center; position: relative; font-size: 32px; font-weight: 700; }
.avatar-card.light { background: #fff; color: #000; }
.avatar-card.dark { background: var(--bg-card); color: #fff; }
@media (max-width: 768px) { .brand-grid { grid-template-columns: 1fr; } .avatar-grid { flex-wrap: wrap; } }
END
echo "export { default as BrandAssetsPage } from './ui/brand-assets-page';" > src/pages/brand-assets-page/index.js

# --- APPLY ---
cat > src/pages/apply-page/ui/apply-page.jsx << 'END'
import { useState } from 'react';
import { FaqAccordion } from '@/widgets/faq-accordion';
import { faqData } from '@/shared/mock/data';
import './apply-page.css';

export default function ApplyPage() {
  const [submitted, setSubmitted] = useState(false);
  const handleSubmit = (e) => { e.preventDefault(); setSubmitted(true); };

  return (
    <div className="container page-wrapper" style={{ maxWidth: '900px' }}>
      <h1 className="title-h1 text-center">Apply for a grant</h1>
      <p className="text-muted text-center mb-40">Please complete the application below for Grant consideration.</p>
      
      <h3 className="mb-40" style={{ fontSize: '20px' }}>How are grants selected?</h3>
      <FaqAccordion items={faqData.slice(0, 4)} />

      <div className="form-container">
        {submitted ? (
          <div className="success-message text-center">
            <h2 style={{ color: 'var(--success)', marginBottom: '16px' }}>Application Submitted!</h2>
            <p>We will review your application and get back to you soon.</p>
            <button className="submit-btn mt-40" onClick={() => setSubmitted(false)}>Submit another</button>
          </div>
        ) : (
          <>
            <h2>Grant application</h2>
            <form onSubmit={handleSubmit}>
              <div className="form-group"><label>Name *</label><input type="text" placeholder="Your name" required /></div>
              <div className="form-group"><label>Email *</label><input type="email" placeholder="your@email.com" required /></div>
              <div className="form-group"><label>About You *</label><textarea rows="4" placeholder="Tell us about yourself or your team" required></textarea></div>
              <div className="form-group"><label>Additional Links</label><textarea rows="3" placeholder="If helpful, please share any links"></textarea></div>
              <button type="submit" className="submit-btn">Submit application</button>
            </form>
          </>
        )}
      </div>
    </div>
  );
}
END
cat > src/pages/apply-page/ui/apply-page.css << 'END'
.page-wrapper { padding-top: 80px; max-width: 1000px; margin: 0 auto; }
.form-container { background: #fff; border-radius: 16px; padding: 40px; color: #000; margin-top: 60px; }
.form-container h2 { margin-bottom: 32px; color: #000; font-size: 24px;}
.form-group { margin-bottom: 20px; }
.form-group label { display: block; margin-bottom: 8px; font-size: 14px; font-weight: 600; }
.form-group input, .form-group textarea { width: 100%; padding: 12px; border-radius: 8px; border: 1px solid #ccc; font-family: inherit; font-size: 15px; outline: none; transition: 0.2s;}
.form-group input:focus, .form-group textarea:focus { border-color: var(--primary); }
.submit-btn { background: var(--primary); color: #fff; padding: 14px; border-radius: 8px; border: none; width: 100%; font-size: 16px; font-weight: 600; transition: 0.2s; cursor: pointer;}
.submit-btn:hover { background: var(--primary-hover); }
.success-message { padding: 30px 0; }
END
echo "export { default as ApplyPage } from './ui/apply-page';" > src/pages/apply-page/index.js

# --- FAQ ---
cat > src/pages/faq-page/ui/faq-page.jsx << 'END'
import { FaqAccordion } from '@/widgets/faq-accordion';
import { CtaBanner } from '@/widgets/cta-banner';
import { faqData } from '@/shared/mock/data';
import './faq-page.css';

export default function FaqPage() {
  return (
    <div className="container page-wrapper" style={{ paddingTop: '80px', maxWidth: '900px', margin: '0 auto' }}>
      <h1 className="title-h1 text-center mb-60">Frequently asked questions</h1>
      <h3 className="mb-40" style={{ fontSize: '20px' }}>Grant application process</h3>
      <FaqAccordion items={faqData} />
      <h3 className="mt-60 mb-40" style={{ fontSize: '20px' }}>Selection criteria</h3>
      <FaqAccordion items={[
        { q: 'What is the dYdX Grants Trust?', a: 'It is a trust that manages the grants program.' },
        { q: 'Where are funds held?', a: 'Funds are held in a multisig wallet.' }
      ]} />
      <CtaBanner />
    </div>
  );
}
END
cat > src/pages/faq-page/ui/faq-page.css << 'END'
.page-wrapper { padding-bottom: 80px; }
.mb-60 { margin-bottom: 60px; }
END
echo "export { default as FaqPage } from './ui/faq-page';" > src/pages/faq-page/index.js

# ==========================================
# 9. APP, LAYOUTS, ROUTER
# ==========================================
cat > src/app/layouts/main-layout.jsx << 'END'
import { Outlet } from 'react-router-dom';
import { Header } from '@/widgets/header';
import { Footer } from '@/widgets/footer';

export const MainLayout = () => {
  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh' }}>
      <Header />
      <main style={{ flex: 1 }}><Outlet /></main>
      <Footer />
    </div>
  );
};
END

cat > src/app/router/index.jsx << 'END'
import { createBrowserRouter } from 'react-router-dom';
import { MainLayout } from '../layouts/main-layout';
import { HomePage } from '@/pages/home-page';
import { RfpsPage } from '@/pages/rfps-page';
import { FundedGrantsPage } from '@/pages/funded-grants-page';
import { GrantDetailsPage } from '@/pages/grant-details-page';
import { GranteePage } from '@/pages/grantee-page';
import { ExpensesPage } from '@/pages/expenses-page';
import { BlogPage } from '@/pages/blog-page';
import { BlogPostPage } from '@/pages/blog-post-page';
import { BrandAssetsPage } from '@/pages/brand-assets-page';
import { ApplyPage } from '@/pages/apply-page';
import { FaqPage } from '@/pages/faq-page';

const router = createBrowserRouter([
  {
    path: '/',
    element: <MainLayout />,
    children: [
      { index: true, element: <HomePage /> },
      { path: 'rfps', element: <RfpsPage /> },
      { path: 'grants', element: <FundedGrantsPage /> },
      { path: 'grant/:id', element: <GrantDetailsPage /> },
      { path: 'grantee/:id', element: <GranteePage /> },
      { path: 'expenses', element: <ExpensesPage /> },
      { path: 'blog', element: <BlogPage /> },
      { path: 'blog/:id', element: <BlogPostPage /> },
      { path: 'brand-assets', element: <BrandAssetsPage /> },
      { path: 'apply', element: <ApplyPage /> },
      { path: 'faq', element: <FaqPage /> },
    ],
  },
]);

export { router };
END

cat > src/main.jsx << 'END'
import React from 'react';
import ReactDOM from 'react-dom/client';
import { RouterProvider } from 'react-router-dom';
import { router } from './app/router';
import './app/styles/global.css';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>,
);
END

# 10. VITE CONFIG (для алиасов)
cat > vite.config.js << 'END'
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import path from 'path';

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
});
END

echo "✅ ГОТОВО! Полная пересборка завершена."
echo "Теперь запусти 'npm run dev'"
