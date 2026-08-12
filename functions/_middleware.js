// Cloudflare Pages middleware - task #159
// Redirect the public deploy alias hnhlaw-site.pages.dev to https://hnhplc.com
// Exact-host match so branch-preview subdomains keep working for PR review.
// Prevents duplicate-content indexing and GA4/GTM analytics contamination from the mirror.
export async function onRequest(context) {
  const url = new URL(context.request.url);
  if (url.hostname === "hnhlaw-site.pages.dev") {
    url.hostname = "hnhplc.com";
    url.protocol = "https:";
    return Response.redirect(url.toString(), 301); // preserves path + query
  }
  return context.next();
}

