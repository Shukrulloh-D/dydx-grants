#!/bin/bash
echo "🔥 Наполняем проект контентом и выравниваем сетки..."

# ==========================================
# 1. ОБНОВЛЯЕМ МОК-ДАННЫЕ (Больше контента)
# ==========================================
cat > src/shared/mock/data.js << 'END'
export const grants = [
  { id: 1, category: 'Crowdfund', title: 'Funding rates page', amount: '$5,000 - $6,000', description: 'Grant will be used to build a dedicated web app to give traders a view of all dYdX asset funding rates across multiple timeframes.', team: ['/images/avatar1.png', '/images/avatar2.png'], image: null, isCompleted: false },
  { id: 2, category: 'Edition', title: 'Tradingview integration', amount: '$5,000 - $6,000', description: 'The grant will be used to build a web application that integrates Tradingview strategies into a dYdX Trading account to execute trades directly through a strategy.', team: ['/images/avatar3.png'], image: null, isCompleted: false },
  { id: 3, category: 'Entry', title: 'Rewards optimization research and paper', amount: '$5,000 - $6,000', description: 'The Grant will be used to write a full research report and code samples that will determine optimal trading strategies for rewards maximization.', team: ['/images/avatar1.png', '/images/avatar3.png'], image: null, isCompleted: false },
  { id: 4, category: 'Education', title: 'Youtube dYdX Education Library', amount: '$5,000', description: 'Grant includes work on Funding Rates page, Rewards & Tracking Simulator, and CLI Trading tool.', team: ['/images/avatar2.png'], image: '/images/cover.png', isCompleted: true },
  { id: 5, category: 'Crowdfund', title: 'Hedge banner', amount: '$5,000 - $6,000', description: 'They can be used to defi... the sponsors to the end of the solar system.', team: ['/images/avatar1.png'], image: null, isCompleted: false },
  { id: 6, category: 'Crowdfund', title: 'Hedge educational content', amount: '$5,000 - $6,000', description: 'This proposal is to expand into the emerging world of decentralized finance.', team: ['/images/avatar2.png'], image: null, isCompleted: false },
  { id: 7, category: 'Analytics', title: 'DGP referral program', amount: '$5,000 - $6,000', description: 'They finally attained a consistent description of the behavior of matter at a fundamental level.', team: ['/images/avatar3.png', '/images/avatar1.png'], image: null, isCompleted: false },
  { id: 8, category: 'Growth', title: 'ETHGlobal event sponsorship', amount: '$5,000 - $6,000', description: 'Because atomic behavior is so unlike ordinary experience, it is very difficult to get used to.', team: ['/images/avatar2.png'], image: null, isCompleted: true },
  { id: 9, category: 'Education', title: 'Rust SDK', amount: '$5,000 - $6,000', description: 'At the end of the 19th century, physics seemed to be almost complete.', team: ['/images/avatar1.png'], image: null, isCompleted: false },
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

// Добавили больше постов в блог
export const blogPosts = [
  { id: 1, title: 'Round 9 of approvals', date: 'January 1, 2022', category: 'Funding round' },
  { id: 2, title: 'Round 8 of approvals', date: 'January 1, 2022', category: 'Funding round' },
  { id: 3, title: 'Round 7 of approvals', date: 'January 1, 2022', category: 'Funding round' },
  { id: 4, title: 'Round 6 of approvals', date: 'January 1, 2022', category: 'Funding round' },
  { id: 5, title: 'Round 5 of approvals', date: 'January 1, 2022', category: 'Funding round' },
  { id: 6, title: 'Round 4 of approvals', date: 'January 1, 2022', category: 'Funding round' },
  { id: 7, title: 'Round 3 of approvals', date: 'January 1, 2022', category: 'Funding round' },
  { id: 8, title: 'Round 2 of approvals', date: 'January 1, 2022', category: 'Funding round' },
];

export const faqData = [
  { q: 'How do I apply?', a: 'Fill out this application form. The application will only be shared with the Grants lead and members of the committee.' },
  { q: 'Can I apply as a U.S. based person/company?', a: 'Yes, you can apply.' },
  { q: 'How will I be compensated?', a: 'Compensation is in USDC.' },
  { q: 'What type of project will qualify for a Grant?', a: 'Any project that benefits the dYdX ecosystem.' },
  { q: 'What is the application timeline? When can I expect to hear back?', a: 'Usually within 2-3 weeks.' },
  { q: 'How can I increase my chances of getting funded?', a: 'Provide a detailed plan and execution timeline.' },
  { q: 'How often do you approve new Rounds of funding?', a: 'Monthly.' },
];
END

# ==========================================
# 2. ПРАВИМ БЛОГ (Центрируем сетку и делаем по 2 карточки)
# ==========================================
cat > src/pages/blog-page/ui/blog-page.css << 'END'
.page-wrapper { 
  padding-top: 80px; 
  /* Ограничиваем ширину страницы блога, чтобы карточки не растягивались */
  max-width: 900px; 
  margin: 0 auto; 
}

/* Переопределяем глобальный grid-2, чтобы карточки стояли ровно по 2 в ряд */
.blog-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 32px;
}

/* Центрируем кнопку Load More */
.load-more-wrapper {
  display: flex;
  justify-content: center;
  margin-top: 60px;
}

@media (max-width: 768px) {
  .blog-grid { grid-template-columns: 1fr; }
}
END

# Обновляем JSX блога, применяя новый класс .blog-grid
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
      
      {/* Используем наш новый класс blog-grid для правильного расположения */}
      <BlogLoadMore total={blogPosts.length} initial={4} step={2}>
        {(visible) => (
          <div className="blog-grid">
            {blogPosts.slice(0, visible).map(post => <ArticleCard key={post.id} post={post} />)}
          </div>
        )}
      </BlogLoadMore>
      
    </div>
  );
}
END

# ==========================================
# 3. РАСХОДЫ (Добавляем больше строк)
# ==========================================
cat > src/pages/expenses-page/ui/expenses-page.jsx << 'END'
import { ExpenseRow } from '@/entities/expense-row';
import { GrantFilter } from '@/features/grant-filter';
import './expenses-page.css';

// Добавили много данных, как на скрине Figma
const mockExpenses = [
  { id: 1, title: 'Airtable Yearly Subscription', type: 'Vendor', amount: '$850.00' },
  { id: 2, title: 'Expense title', type: 'Type', amount: '-$1,100.37 USDC' },
  { id: 3, title: 'Expense title', type: 'Type', amount: '-$1,100.37 USDC' },
  { id: 4, title: 'Expense title', type: 'Type', amount: '-$1,100.37 USDC' },
  { id: 5, title: 'Expense title', type: 'Type', amount: '-$1,100.37 USDC' },
  { id: 6, title: 'Expense title', type: 'Type', amount: '-$1,100.37 USDC' },
  { id: 7, title: 'Expense title', type: 'Type', amount: '-$1,100.37 USDC' },
  { id: 8, title: 'Expense title', type: 'Type', amount: '-$1,100.37 USDC' },
  { id: 9, title: 'Expense title', type: 'Type', amount: '-$1,100.37 USDC' },
];

export default function ExpensesPage() {
  return (
    <div className="container page-wrapper">
      <div className="text-center mb-40"><h1 className="title-h1">Program expenses</h1></div>
      <GrantFilter options={['All', 'Category', 'Category', 'Category']} current="All" onChange={() => {}} />
      <div className="expense-list">
        {mockExpenses.map(e => <ExpenseRow key={e.id} expense={e} />)}
      </div>
    </div>
  );
}
END

# ==========================================
# 4. FAQ PAGE (Добавляем блоки и вопросы)
# ==========================================
cat > src/pages/faq-page/ui/faq-page.jsx << 'END'
import { FaqAccordion } from '@/widgets/faq-accordion';
import { CtaBanner } from '@/widgets/cta-banner';
import { faqData } from '@/shared/mock/data';
import './faq-page.css';

export default function FaqPage() {
  return (
    <div className="container page-wrapper" style={{ paddingTop: '80px', maxWidth: '900px', margin: '0 auto' }}>
      <h1 className="title-h1 text-center mb-60">Frequently asked questions</h1>
      
      {/* Блок 1 */}
      <div className="faq-section">
        <h3 className="faq-section-title">Grant application process</h3>
        <FaqAccordion items={faqData} />
      </div>

      {/* Блок 2 */}
      <div className="faq-section mt-60">
        <h3 className="faq-section-title">Selection criteria</h3>
        <FaqAccordion items={[
          { q: 'What is the dYdX Grants Trust?', a: 'It is a trust that manages the grants program.' },
          { q: 'Where are funds held?', a: 'Funds are held in a multisig wallet.' },
          { q: 'When was the program launched?', a: 'The program was launched in 2021.' },
          { q: 'Who are the Trustees?', a: 'The trustees are members of the community.' }
        ]} />
      </div>

      {/* Блок 3 */}
      <div className="faq-section mt-60">
        <h3 className="faq-section-title">The Grants Trust</h3>
        <FaqAccordion items={[
          { q: 'What is the dYdX Grants Trust?', a: 'It is a trust that manages the grants program.' },
          { q: 'Where are funds held?', a: 'Funds are held in a multisig wallet.' },
          { q: 'Who are the Trustees?', a: 'The trustees are members of the community.' },
          { q: 'Who is the Enforcer?', a: 'The Enforcer oversees the trust.' }
        ]} />
      </div>

      <CtaBanner />
    </div>
  );
}
END

cat > src/pages/faq-page/ui/faq-page.css << 'END'
.page-wrapper { padding-bottom: 80px; }
.faq-section-title { 
  font-size: 24px; 
  margin-bottom: 24px; 
  color: #fff; 
}
.mb-60 { margin-bottom: 60px; }
END

echo "✅ Всё готово! Контент добавлен, сетки выровнены."
