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
