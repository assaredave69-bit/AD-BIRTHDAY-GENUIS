$urls = @{
    "dashboard.html" = "https://contribution.usercontent.google.com/download?c=CgthaWRhX2NvZGVmeBJ8Eh1hcHBfY29tcGFuaW9uX2dlbmVyYXRlZF9maWxlcxpbCiVodG1sXzhiZDNhOTUwOTEzZjQ4ZDVhOGNmYTgxMWFkZDdhMjI2EgsSBxDOup3A4xAYAZIBJAoKcHJvamVjdF9pZBIWQhQxNzY3NDUyMDY0NDM3NjY4MTU1Mw&filename=&opi=89354086"
    "calendar.html" = "https://contribution.usercontent.google.com/download?c=CgthaWRhX2NvZGVmeBJ8Eh1hcHBfY29tcGFuaW9uX2dlbmVyYXRlZF9maWxlcxpbCiVodG1sXzgyMTI2ZmE2OTU1YTQ1MjE4Zjk0ODJmMGVhN2NjMDQxEgsSBxDOup3A4xAYAZIBJAoKcHJvamVjdF9pZBIWQhQxNzY3NDUyMDY0NDM3NjY4MTU1Mw&filename=&opi=89354086"
    "messages.html" = "https://contribution.usercontent.google.com/download?c=CgthaWRhX2NvZGVmeBJ8Eh1hcHBfY29tcGFuaW9uX2dlbmVyYXRlZF9maWxlcxpbCiVodG1sX2Y4NGYxODllYmFmNzQ0NDc5MTBhOWM5ZWYwMWZjMzI2EgsSBxDOup3A4xAYAZIBJAoKcHJvamVjdF9pZBIWQhQxNzY3NDUyMDY0NDM3NjY4MTU1Mw&filename=&opi=89354086"
    "stats.html" = "https://contribution.usercontent.google.com/download?c=CgthaWRhX2NvZGVmeBJ8Eh1hcHBfY29tcGFuaW9uX2dlbmVyYXRlZF9maWxlcxpbCiVodG1sXzk0NTJlNGIwN2Y3YjRiOWRiNTI1YTZkMzFkNjc5YjlmEgsSBxDOup3A4xAYAZIBJAoKcHJvamVjdF9pZBIWQhQxNzY3NDUyMDY0NDM3NjY4MTU1Mw&filename=&opi=89354086"
    "contacts.html" = "https://contribution.usercontent.google.com/download?c=CgthaWRhX2NvZGVmeBJ8Eh1hcHBfY29tcGFuaW9uX2dlbmVyYXRlZF9maWxlcxpbCiVodG1sX2E1ODE2N2FhNDBlYTQ2ZDc4ZTdhOWM0OWU1ZDQ5MTllEgsSBxDOup3A4xAYAZIBJAoKcHJvamVjdF9pZBIWQhQxNzY3NDUyMDY0NDM3NjY4MTU1Mw&filename=&opi=89354086"
    "config.html" = "https://contribution.usercontent.google.com/download?c=CgthaWRhX2NvZGVmeBJ8Eh1hcHBfY29tcGFuaW9uX2dlbmVyYXRlZF9maWxlcxpbCiVodG1sXzlhN2MyZjY1NGQ0NTQ4ZmJiOTBiM2VkN2ZiNzkwYTIzEgsSBxDOup3A4xAYAZIBJAoKcHJvamVjdF9pZBIWQhQxNzY3NDUyMDY0NDM3NjY4MTU1Mw&filename=&opi=89354086"
    "sync.html" = "https://contribution.usercontent.google.com/download?c=CgthaWRhX2NvZGVmeBJ8Eh1hcHBfY29tcGFuaW9uX2dlbmVyYXRlZF9maWxlcxpbCiVodG1sXzQ3ZmY2NDZlYzA3MzQ4MjdhOTg2NzM0NzJiZTVjNTUyEgsSBxDOup3A4xAYAZIBJAoKcHJvamVjdF9pZBIWQhQxNzY3NDUyMDY0NDM3NjY4MTU1Mw&filename=&opi=89354086"
}

foreach ($item in $urls.GetEnumerator()) {
    Invoke-WebRequest -Uri $item.Value -OutFile $item.Key
}
