// Birthday Genius - Dashboard Logic

document.addEventListener('DOMContentLoaded', () => {
    const upcomingContainer = document.getElementById('dashboard-upcoming-container');
    
    // Fallbacks if nothing is in local storage
    const defaultContacts = [
        { id: '1', name: 'David Chen', date: '05 Mars', relationship: 'Travail', type: 'Travail', avatarType: 'img', src: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCBMRgJ1L4gk4bSrddbB__ROUuLmO4ZrJI5sp00DbsCnF-D5-nwiCNDflA9SIo3qOSyEv2BxCNiexAbw-tihjLrPHVXAOwEaQ5D--OjSxJ-N2gx1iZrInOKo7FuNU3lUiEBKt8D53Fh8DU4s3rKnklbdnRSdRJbXxQQKjliykBrkuGw2_VoyjbxBl5R_Lg749jz4M580BG0qkZTFHQUmxEcT4W4II700Jv0ZPltgPp5iopr0Y5Nc4PEx8XJz_ywgP3kt8ylphv7SQco', rawDate: '03-05' },
        { id: '4', name: 'Sarah Jenkins', date: '14 Octobre', relationship: 'Famille', type: 'Famille', avatarType: 'img', src: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDxfhYNI-QHlR6gwjFpLR5Dccw-mpFMyZNCEwe9W23NAO2zE4WG8ifs8n816TXUL7S6zjHgLbG5X-MqnDfw-7lUcIr9xnVEnJ7aQfY_AcF5d3iq8OpDWbSUkLSTT735KugFNhUuTwbR9ipHcJy1TZOGJOgSx5bPOn7MpGP2QQ4G04kuqmPkIstq_njxc49bj2v1sIxyAUt3WYcz38z6XKEuCvxwwV0X5rh1BoJ7HnVZ3v2NzMaujRruTbp5k-u4yM5q9Bh7gT9qWdH9', rawDate: '10-14' },
        { id: '5', name: 'Marcus Rodriguez', date: '22 Octobre', relationship: 'Ami', type: 'Ami', avatarType: 'initials', src: 'MR', rawDate: '10-22' }
    ];

    function getContacts() {
        const stored = localStorage.getItem('birthdayGeniusContacts');
        if (stored) {
            return JSON.parse(stored);
        }
        return defaultContacts;
    }

    function renderUpcoming() {
        if (!upcomingContainer) return;
        
        const contacts = getContacts();
        
        // Take the first 5 contacts to show as "upcoming" for demo purposes
        const upcoming = contacts.slice(0, 5);
        upcomingContainer.innerHTML = '';
        
        upcoming.forEach((contact, index) => {
            let avatarHtml = '';
            if (contact.avatarType === 'img') {
                avatarHtml = `<div class="size-16 rounded-full border-2 border-slate-200 dark:border-primary/20 bg-center bg-cover" style="background-image: url('${contact.src}');"></div>`;
            } else {
                avatarHtml = `<div class="size-16 rounded-full border-2 border-slate-200 dark:border-primary/20 flex items-center justify-center bg-primary/10 text-primary font-bold text-xl uppercase">${contact.src}</div>`;
            }

            // Fake days for the demo
            const relativeDays = ['Demain', 'Dans 2j', 'Dans 5j', 'Dans 12j', contact.date];
            const relativeText = relativeDays[index] || contact.date;

            upcomingContainer.innerHTML += `
                <div class="flex flex-col items-center gap-2 min-w-[100px] cursor-pointer" onclick="window.location.href='messages.html'">
                    ${avatarHtml}
                    <div class="text-center">
                        <p class="text-slate-900 dark:text-slate-100 text-sm font-semibold truncate w-20">${contact.name.split(' ')[0]}</p>
                        <p class="text-slate-500 dark:text-slate-400 text-xs">${relativeText}</p>
                    </div>
                </div>
            `;
        });
    }

    renderUpcoming();
});
