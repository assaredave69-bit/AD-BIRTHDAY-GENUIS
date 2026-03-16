// Birthday Genius - AI Message Generator Simulation

document.addEventListener('DOMContentLoaded', () => {
    const generateBtn = document.getElementById('generate-ai-btn');
    const messagesList = document.getElementById('messages-list-container');
    
    // Some pre-existing fake messages for the demo
    const initialMessages = `
        <!-- Message Item 2 -->
        <div class="bg-white dark:bg-slate-800/50 p-4 rounded-xl border border-primary/5 flex items-center gap-4">
            <div class="relative">
                <div class="size-14 rounded-full bg-cover bg-center border-2 border-primary/20" data-alt="Portrait d'une femme souriante" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuBoqNcWM4lL60DnRunw9b4Y_RBOejQYGbZqUlQ0bA3WiXB8G2-TuoonOwNnjR48dEqB_crymRZrOUQFc32O_pVUJCf0TcxkOpz1yc2eBNI58Wl4WNQFgIEKWKPoe7LU7LpINmFYUdCRjdTEiu8D3Uj-IQGP-aEqszH9yXJCvQmDwRQk2GoHNRo86DjuQvXMleG3bpNg0-y3MAoJeddVUc8R3cpVRpivOR47c0JcpWa7Ei0PvwL9uHDIvmCY3t4UylLzr5jDqHkxSzPa')"></div>
            </div>
            <div class="flex-1">
                <h3 class="font-bold text-slate-900 dark:text-slate-100">Julie Martin</h3>
                <p class="text-xs text-slate-500 dark:text-slate-400">Généré hier • 1:15</p>
                <div class="flex items-end gap-0.5 h-4 mt-2 opacity-50">
                    <div class="bg-slate-400 w-1 h-1 rounded-full"></div>
                    <div class="bg-slate-400 w-1 h-2 rounded-full"></div>
                    <div class="bg-slate-400 w-1 h-4 rounded-full"></div>
                    <div class="bg-slate-400 w-1 h-3 rounded-full"></div>
                    <div class="bg-slate-400 w-1 h-1 rounded-full"></div>
                    <div class="bg-slate-400 w-1 h-2 rounded-full"></div>
                    <div class="bg-slate-400 w-1 h-4 rounded-full"></div>
                    <div class="bg-slate-400 w-1 h-3 rounded-full"></div>
                </div>
            </div>
            <div class="flex gap-2">
                <button class="size-10 flex items-center justify-center bg-primary text-white rounded-full hover:bg-primary/90">
                    <span class="material-symbols-outlined">pause</span>
                </button>
                <button class="size-10 flex items-center justify-center text-primary transition-colors">
                    <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1">favorite</span>
                </button>
            </div>
        </div>
        <!-- Message Item 3 -->
        <div class="bg-white dark:bg-slate-800/50 p-4 rounded-xl border border-primary/5 flex items-center gap-4 opacity-70">
            <div class="size-14 rounded-full bg-cover bg-center border-2 border-primary/20" data-alt="Portrait d'un homme barbu" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuAnu6OJtk_UjF3kTrcqini9lez-lY5-Ctjv7bvCmTNpohGCU6RGa673BgMNBHLpRPlzs33hmy1bYQFPFCd1Q8K5YqpwXJA96034aM5tYdiw2_i4NtqsJefKUa3qRELxjeAnmZSnU85JqTT0AWvnM6jaNcqoZ764pMrqN90rCjgnXmF8a6f7LiIUENytA0LD5ZkW85yfOYugukn92kCmabFzXzNshLja7EJcxek4xwFYHz03TVNFffk5lbYuOzL9t0emQkalIke7lCgI')"></div>
            <div class="flex-1">
                <h3 class="font-bold text-slate-900 dark:text-slate-100">Marc Dupont</h3>
                <p class="text-xs text-slate-500 dark:text-slate-400">Le 12 Mai • 0:58</p>
            </div>
            <div class="flex gap-2">
                <button class="size-10 flex items-center justify-center bg-slate-200 dark:bg-slate-700 text-slate-600 dark:text-slate-300 rounded-full">
                    <span class="material-symbols-outlined">play_arrow</span>
                </button>
                <button class="size-10 flex items-center justify-center text-slate-400">
                    <span class="material-symbols-outlined">more_vert</span>
                </button>
            </div>
        </div>
    `;

    function getContacts() {
        const stored = localStorage.getItem('birthdayGeniusContacts');
        if (stored) {
            return JSON.parse(stored);
        }
        return [];
    }

    if (generateBtn && messagesList) {
        generateBtn.addEventListener('click', () => {
            const contacts = getContacts();
            
            if (contacts.length === 0) {
                alert("Veuillez d'abord ajouter un contact dans l'onglet 'Contacts' !");
                return;
            }

            // Pick a random contact
            const randomContact = contacts[Math.floor(Math.random() * contacts.length)];
            const btnText = generateBtn.querySelector('span:last-child');
            const originalText = btnText.innerText;
            
            // Loading state
            btnText.innerText = `Génération pour ${randomContact.name.split(' ')[0]}...`;
            generateBtn.classList.add('opacity-75', 'cursor-not-allowed');
            generateBtn.disabled = true;

            setTimeout(() => {
                // Restore button state
                btnText.innerText = originalText;
                generateBtn.classList.remove('opacity-75', 'cursor-not-allowed');
                generateBtn.disabled = false;

                // Create new message HTML
                let avatarHtml = '';
                if (randomContact.avatarType === 'img') {
                    avatarHtml = `<div class="size-14 rounded-full bg-cover bg-center border-2 border-primary/20" style="background-image: url('${randomContact.src}')"></div>`;
                } else {
                    avatarHtml = `<div class="size-14 rounded-full border-2 border-primary/20 flex items-center justify-center bg-primary/10 text-primary font-bold text-xl uppercase">${randomContact.src}</div>`;
                }

                const newMessageHtml = `
                    <div class="bg-white dark:bg-slate-800 p-4 rounded-xl border border-primary/20 shadow-md flex items-center gap-4 animate-pulse duration-1000 transform transition-all">
                        <div class="relative">
                            ${avatarHtml}
                            <div class="absolute -bottom-1 -right-1 bg-green-500 size-4 rounded-full border-2 border-white dark:border-slate-800"></div>
                        </div>
                        <div class="flex-1">
                            <h3 class="font-bold text-slate-900 dark:text-slate-100">${randomContact.name}</h3>
                            <p class="text-xs text-primary font-bold">À l'instant • 0:45</p>
                            <!-- Simple Audio Visualizer Mockup -->
                            <div class="flex items-end gap-0.5 h-4 mt-2">
                                <div class="bg-primary/30 w-1 h-2 rounded-full"></div>
                                <div class="bg-primary/50 w-1 h-3 rounded-full"></div>
                                <div class="bg-primary w-1 h-4 rounded-full"></div>
                                <div class="bg-primary/70 w-1 h-2 rounded-full"></div>
                                <div class="bg-primary/40 w-1 h-1 rounded-full"></div>
                                <div class="bg-primary/60 w-1 h-3 rounded-full"></div>
                                <div class="bg-primary w-1 h-4 rounded-full"></div>
                                <div class="bg-primary/50 w-1 h-2 rounded-full"></div>
                            </div>
                        </div>
                        <div class="flex gap-2">
                            <button class="size-10 flex items-center justify-center bg-primary text-white rounded-full hover:bg-primary/90 shadow-lg shadow-primary/30 active:scale-95">
                                <span class="material-symbols-outlined">play_arrow</span>
                            </button>
                            <button class="size-10 flex items-center justify-center text-slate-400 hover:text-primary transition-colors">
                                <span class="material-symbols-outlined">share</span>
                            </button>
                        </div>
                    </div>
                `;

                // Add to top of list
                messagesList.insertAdjacentHTML('afterbegin', newMessageHtml);

                // Stop pulse after 1.5s
                setTimeout(() => {
                    const newEl = messagesList.firstElementChild;
                    if(newEl) {
                        newEl.classList.remove('animate-pulse');
                    }
                }, 1500);

            }, 2000); // 2 second mock loading
        });
    }
});
