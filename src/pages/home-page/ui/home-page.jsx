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
        {/* SVG  */}
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
        {/* стрелка поён */}
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
