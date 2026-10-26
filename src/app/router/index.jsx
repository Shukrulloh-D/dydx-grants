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
