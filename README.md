# 🚀 dYdX Grants Platform

**A high-performance, feature-rich web application for the dYdX community grants program.**

![React](https://img.shields.io/badge/React-18-blue)
![Vite](https://img.shields.io/badge/Vite-Latest-purple)
![FSD](https://img.shields.io/badge/Architecture-Feature--Sliced%20Design-orange)
![License](https://img.shields.io/badge/License-MIT-green)

## 📖 About the Project
This is a fully responsive, multi-page Single Page Application (SPA) designed to showcase the dYdX community grants. The project was built with a strong emphasis on clean architecture, modern UI/UX practices, and declarative state management.

The design is inspired by the official dYdX Grants Figma mockups, but enhanced with smooth animations, glowing hover effects, and custom interactive elements to provide a premium user experience.

## 🛠️ Tech Stack & Tools
*   **Core:** React 18 (Functional Components, Hooks)
*   **Routing:** React Router v6 (`createBrowserRouter`, nested layouts)
*   **Styling:** Vanilla CSS3 (Custom Properties, Flexbox, CSS Grid, CSS Animations, `clip-path` for custom shapes)
*   **Icons:** `lucide-react` (Modern SVG icons)
*   **Architecture:** Feature-Sliced Design (FSD)

## 🏗️ Architecture: Feature-Sliced Design
The project strictly follows the FSD methodology to ensure scalability, maintainability, and low coupling. The structure is divided into the following layers:
*   **`app/`**: App initialization, routing, global styles, and providers.
*   **`pages/`**: Route-level components (Home, RFPs, Grants, Blog, etc.).
*   **`widgets/`**: Large, self-contained UI blocks (Header, Footer, FAQ Accordion, CTA Banner).
*   **`features/`**: Interactive logic and user actions (Filters, Toggles, Load More).
*   **`entities/`**: Business domain components (GrantCard, ArticleCard, RfpRow).
*   **`shared/`**: Reusable foundation (UI-kit, Mock Data, global configs).

## ✨ Key Features & Logic
*   **Advanced Filtering:** Real-time filtering of Grants and RFPs by category and status.
*   **Interactive UI:** Animated FAQ accordions, "Load More" pagination for the blog, and responsive mobile burger menu.
*   **Form Handling:** A functional "Apply for Grant" form with basic validation and a success state simulation.
*   **Dynamic Layouts:** Conditional rendering for project covers (handling both "with image" and "no image" states gracefully).
*   **Custom Styling:** Dark theme with CSS variables, background grid pattern, custom scrollbar, and glowing neon accents.
*   **Fully Responsive:** Tailored layouts for Desktop, Tablet, and Mobile devices.

## 🚀 Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/dydx-grants.git
   cd dydx-grants
