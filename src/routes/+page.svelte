<script lang="ts">
  import words from '../data.json';
  let timeBar: HTMLDivElement;
  let duration = 5;
  let wordIdx = 0;
  $: currentWord = words[wordIdx];
  const changeWord = () => {
    wordIdx = Math.floor(Math.random() * words.length);   
  };

  const restart = () => {
    if (timeBar) {
        timeBar.classList.remove('time-bar');
        void timeBar.offsetWidth;
        timeBar.classList.add('time-bar');
    }
  };

  setInterval(() => {
      changeWord();
      restart();
  }, duration * 1000);
</script>

<svelte:head>
  <title>Study words</title>
</svelte:head>

<main class="container">
  <div class="time-bar" bind:this={timeBar} style="--duration: {duration}">
    <div></div>
  </div>
  <div class="word-container">
    <span class="word">{currentWord}</span>
  </div>
</main>

<style>
  :global(body) {
    margin: 0;
  }
  .time-bar div {    
    height: 8px;
    background: skyblue;
    animation: roundtime calc(var(--duration) * 1s) linear forwards;
    transform-origin: left center;
  }
  @keyframes roundtime {
    to {
      transform: scaleX(0);
    }
  }
  .word-container {
    margin-top: 2rem;
    display: flex;
    flex-direction: row;
    justify-content: center;
  }
  .word {
    font-family: Malgun Gothic, sans-serif;
    font-size: 12rem;
  }
</style>
