export default {
  async fetch(request) {
    const script = await fetch("https://raw.githubusercontent.com/eyemono-moe/dotfiles/main/fly/index.sh")
    const content = await script.text()
    return new Response(content, {
      headers: {
        "Content-Type": "text/x-shellscript",
        "Cache-Control": "no-cache, no-store, must-revalidate",
        "Pragma": "no-cache",
        "Expires": "0"
      }
    })
  }
}