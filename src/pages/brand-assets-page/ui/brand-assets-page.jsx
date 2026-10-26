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
