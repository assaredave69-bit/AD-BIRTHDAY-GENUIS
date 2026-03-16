$files = Get-ChildItem -Filter *.html

foreach ($file in $files) {
    if ($file.Name -eq "index.html") { continue }
    
    $content = Get-Content $file.FullName -Raw
    
    # Dashboard bottom nav
    $content = $content -replace '<a class="flex flex-col items-center gap-1 group" href="#">(\s*<div.*?home.*?)', '<a class="flex flex-col items-center gap-1 group" href="dashboard.html">$1'
    $content = $content -replace '<a class="flex flex-col items-center gap-1 group" href="#">(\s*<div.*?calendar_today.*?)', '<a class="flex flex-col items-center gap-1 group" href="calendar.html">$1'
    $content = $content -replace '<a class="flex flex-col items-center gap-1 group" href="#">(\s*<div.*?person_add.*?)', '<a class="flex flex-col items-center gap-1 group" href="contacts.html">$1'
    $content = $content -replace '<a class="flex flex-col items-center gap-1 group" href="#">(\s*<div.*?settings.*?)', '<a class="flex flex-col items-center gap-1 group" href="config.html">$1'
    
    # Calendar bottom nav
    $content = $content -replace '<a class="flex flex-col items-center gap-1 text-primary" href="#">(\s*<span.*?calendar_today.*?)', '<a class="flex flex-col items-center gap-1 text-primary" href="calendar.html">$1'
    $content = $content -replace '<a class="flex flex-col items-center gap-1 text-slate-400" href="#">(\s*<span.*?contacts.*?)', '<a class="flex flex-col items-center gap-1 text-slate-400" href="contacts.html">$1'
    $content = $content -replace '<a class="flex flex-col items-center gap-1 text-slate-400" href="#">(\s*<span.*?featured_seasonal_and_gifts.*?)', '<a class="flex flex-col items-center gap-1 text-slate-400" href="dashboard.html">$1'
    $content = $content -replace '<a class="flex flex-col items-center gap-1 text-slate-400" href="#">(\s*<span.*?settings.*?)', '<a class="flex flex-col items-center gap-1 text-slate-400" href="config.html">$1'
    
    # Config bottom nav
    $content = $content -replace '<a class="flex flex-1 flex-col items-center justify-end gap-1 text-slate-400 dark:text-slate-500 hover:text-primary transition-colors" href="#">(\s*<div.*?group.*?)', '<a class="flex flex-1 flex-col items-center justify-end gap-1 text-slate-400 dark:text-slate-500 hover:text-primary transition-colors" href="contacts.html">$1'
    $content = $content -replace '<a class="flex flex-1 flex-col items-center justify-end gap-1 text-primary" href="#">(\s*<div.*?auto_fix_high.*?)', '<a class="flex flex-1 flex-col items-center justify-end gap-1 text-primary" href="config.html">$1'
    $content = $content -replace '<a class="flex flex-1 flex-col items-center justify-end gap-1 text-slate-400 dark:text-slate-500 hover:text-primary transition-colors" href="#">(\s*<div.*?settings.*?)', '<a class="flex flex-1 flex-col items-center justify-end gap-1 text-slate-400 dark:text-slate-500 hover:text-primary transition-colors" href="sync.html">$1'
    
    # Contacts bottom nav
    $content = $content -replace '<a class="flex flex-col items-center gap-1 text-slate-400" href="#">(\s*<span.*?home.*?)', '<a class="flex flex-col items-center gap-1 text-slate-400" href="dashboard.html">$1'
    $content = $content -replace '<a class="flex flex-col items-center gap-1 text-primary" href="#">(\s*<span.*?group.*?)', '<a class="flex flex-col items-center gap-1 text-primary" href="contacts.html">$1'
    $content = $content -replace '<a class="flex flex-col items-center gap-1 text-slate-400" href="#">(\s*<span.*?calendar_today.*?)', '<a class="flex flex-col items-center gap-1 text-slate-400" href="calendar.html">$1'
    $content = $content -replace '<a class="flex flex-col items-center gap-1 text-slate-400" href="#">(\s*<span.*?settings.*?)', '<a class="flex flex-col items-center gap-1 text-slate-400" href="config.html">$1'
    
    # Messages bottom nav & tabs
    $content = $content -replace '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-slate-400 hover:text-primary transition-colors" href="#">(\s*<span.*?home.*?)', '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-slate-400 hover:text-primary transition-colors" href="dashboard.html">$1'
    $content = $content -replace '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-primary" href="#">(\s*<span.*?mic.*?)', '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-primary" href="messages.html">$1'
    $content = $content -replace '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-slate-400 hover:text-primary transition-colors" href="#">(\s*<span.*?group.*?)', '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-slate-400 hover:text-primary transition-colors" href="contacts.html">$1'
    $content = $content -replace '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-slate-400 hover:text-primary transition-colors" href="#">(\s*<span.*?account_circle.*?)', '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-slate-400 hover:text-primary transition-colors" href="stats.html">$1'
    $content = $content -replace '<a class="flex flex-col items-center justify-center border-b-2 border-primary text-primary pb-3 pt-4" href="#">', '<a class="flex flex-col items-center justify-center border-b-2 border-primary text-primary pb-3 pt-4" href="messages.html">'
    $content = $content -replace '<a class="flex flex-col items-center justify-center border-b-2 border-transparent text-slate-500 dark:text-slate-400 pb-3 pt-4 hover:text-primary transition-colors" href="#">', '<a class="flex flex-col items-center justify-center border-b-2 border-transparent text-slate-500 dark:text-slate-400 pb-3 pt-4 hover:text-primary transition-colors" href="messages.html">'
    
    # Stats bottom nav
    $content = $content -replace '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-slate-500 dark:text-slate-400 hover:text-primary dark:hover:text-primary transition-colors" href="#">(\s*<span.*?home.*?)', '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-slate-500 dark:text-slate-400 hover:text-primary dark:hover:text-primary transition-colors" href="dashboard.html">$1'
    $content = $content -replace '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-slate-500 dark:text-slate-400 hover:text-primary dark:hover:text-primary transition-colors" href="#">(\s*<span.*?contacts.*?)', '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-slate-500 dark:text-slate-400 hover:text-primary dark:hover:text-primary transition-colors" href="contacts.html">$1'
    $content = $content -replace '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-slate-500 dark:text-slate-400 hover:text-primary dark:hover:text-primary transition-colors" href="#">(\s*<span.*?calendar_month.*?)', '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-slate-500 dark:text-slate-400 hover:text-primary dark:hover:text-primary transition-colors" href="calendar.html">$1'
    $content = $content -replace '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-primary relative" href="#">(\s*<span.*?analytics.*?)', '<a class="flex flex-1 flex-col items-center justify-center gap-1 text-primary relative" href="stats.html">$1'
    
    # Other isolated links/buttons
    # In dashboard: Back button, profile click -> stats.html
    $content = $content -replace '<button aria-label="Envoyer un message".*?>', '<button aria-label="Envoyer un message" onclick="window.location.href=''messages.html''" class="flex size-10 items-center justify-center rounded-xl bg-primary text-white hover:bg-primary/90 shadow-lg shadow-primary/20">'
    $content = $content -replace '<button aria-label="Notifications".*?>', '<button aria-label="Notifications" onclick="window.location.href=''sync.html''" class="flex size-10 items-center justify-center rounded-full hover:bg-primary/10 transition-colors">'
    $content = $content -replace '<div class="size-10 rounded-full border-2 border-primary bg-center bg-cover bg-no-repeat".*?title="Profil utilisateur">', '<div onclick="window.location.href=''stats.html''" class="cursor-pointer size-10 rounded-full border-2 border-primary bg-center bg-cover bg-no-repeat" style=''background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDJgW_tsQ535ArI2kMuqUv5yu1V7kpt1PnMLw2H5ZsmpCYqt_EBc1BEpphwuhV07VTlr9yxRIAMpYwJyUXptNdcpixyP5oAhTVyeHG7gcbQNCBkiHpCOWe9M8RUgNoGL0dPIlUTBNqvLab4oKCDF_I7HtGeq04PpZD6EBDiyFphVfjk82RfPBGg6bN5FpLqNAjiilbcrsTgrPB738jiN8KREXmZA_DxlwdGzJJROe7-Z6zbs2PjfbRXYZV9EKIPBFDG9jkScR7f7rBb");'' title="Profil utilisateur">'
    
    # In config, messages, stats, sync: Back button -> history.back() or dashboard
    $content = $content -replace '<button class="text-slate-900 dark:text-slate-100 p-2 hover:bg-slate-200 dark:hover:bg-primary/20 rounded-full transition-colors">(\s*<span.*?arrow_back.*?)', '<button onclick="window.location.href=''dashboard.html''" class="text-slate-900 dark:text-slate-100 p-2 hover:bg-slate-200 dark:hover:bg-primary/20 rounded-full transition-colors">$1'
    $content = $content -replace '<button class="text-slate-900 dark:text-slate-100 p-2 hover:bg-primary/10 rounded-full transition-colors">(\s*<span.*?arrow_back.*?)', '<button onclick="window.location.href=''dashboard.html''" class="text-slate-900 dark:text-slate-100 p-2 hover:bg-primary/10 rounded-full transition-colors">$1'
    $content = $content -replace '<div class="flex size-10 shrink-0 items-center justify-center rounded-full hover:bg-slate-200 dark:hover:bg-primary/20 cursor-pointer">(\s*<span.*?arrow_back.*?)', '<div onclick="window.location.href=''dashboard.html''" class="flex size-10 shrink-0 items-center justify-center rounded-full hover:bg-slate-200 dark:hover:bg-primary/20 cursor-pointer">$1'
    $content = $content -replace '<button class="flex size-10 items-center justify-center rounded-full hover:bg-primary/10 transition-colors">(\s*<span.*?arrow_back.*?)', '<button onclick="window.location.href=''contacts.html''" class="flex size-10 items-center justify-center rounded-full hover:bg-primary/10 transition-colors">$1'

    # Contacts import buttons
    $content = $content -replace '<button class="flex items-center gap-2 px-4 py-2 bg-primary text-white rounded-full text-sm font-semibold shrink-0 shadow-lg shadow-primary/20">', '<button onclick="window.location.href=''sync.html''" class="flex items-center gap-2 px-4 py-2 bg-primary text-white rounded-full text-sm font-semibold shrink-0 shadow-lg shadow-primary/20">'
    $content = $content -replace '<button class="flex items-center gap-2 px-4 py-2 bg-slate-200 dark:bg-slate-800 text-slate-700 dark:text-slate-200 rounded-full text-sm font-semibold shrink-0">', '<button onclick="window.location.href=''sync.html''" class="flex items-center gap-2 px-4 py-2 bg-slate-200 dark:bg-slate-800 text-slate-700 dark:text-slate-200 rounded-full text-sm font-semibold shrink-0">'
    
    # Sync links
    $content = $content -replace '<a class="text-primary hover:underline" href="#">', '<a class="text-primary hover:underline" href="dashboard.html">'

    Set-Content -Path $file.FullName -Value $content
}
