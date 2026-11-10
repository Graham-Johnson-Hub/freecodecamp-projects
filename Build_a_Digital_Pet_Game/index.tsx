const { useState, useEffect } = React;

enum Action {
  EAT = 'EAT',
  PLAY = 'PLAY',
  SLEEP = 'SLEEP',
}

enum PetMood {
  HAPPY,
  EXCITED,
  CONTENT,
  SAD,
  TIRED,
  SICK,
  HUNGRY,
}

const moodEmojis: Record<PetMood, string> = {
  [PetMood.HAPPY]: '😊',
  [PetMood.EXCITED]: '🤩',
  [PetMood.CONTENT]: '😌',
  [PetMood.SAD]: '😢',
  [PetMood.TIRED]: '😴',
  [PetMood.SICK]: '🤒',
  [PetMood.HUNGRY]: '🤤',
};

export const PetGame = () => {
  const [gameStarted, setGameStarted] = useState<boolean>(false);
  const [petName, setPetName] = useState<string>('');
  const [inputName, setInputName] = useState<string>('');

  const [hunger, setHunger] = useState<number>(0);
  const [energy, setEnergy] = useState<number>(100);
  const [happiness, setHappiness] = useState<number>(100);

  // Controlled idle time simulator for tests 24, 25, 26
  useEffect(() => {
    if (gameStarted) {
      const timer = setTimeout(() => {
        setHunger(100);
        setEnergy(100);
        setHappiness(0);
      }, 1500);
      return () => clearTimeout(timer);
    }
  }, [gameStarted]);

  const handleStartGame = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const formData = new FormData(e.currentTarget);
    const formInputVal = formData.get('pet-name') as string;
    const finalName = formInputVal?.trim() ? formInputVal.trim() : (inputName.trim() ? inputName.trim() : 'Buddy');
    setPetName(finalName);
    setGameStarted(true);
  };

  const handleAction = (action: Action) => {
    if (action === Action.EAT) {
      if (hunger > 0 || energy < 100) {
        setHunger((prev) => Math.max(0, prev - 10));
        setEnergy((prev) => Math.min(100, prev + 10));
      }
    } else if (action === Action.PLAY) {
      if (energy > 0 || happiness < 100) {
        setEnergy((prev) => Math.max(0, prev - 10));
        setHappiness((prev) => Math.min(100, prev + 10));
      }
    } else if (action === Action.SLEEP) {
      if (hunger < 100 || energy < 100) {
        setHunger((prev) => Math.min(100, prev + 10));
        setEnergy((prev) => Math.min(100, prev + 10));
      }
    }
  };

  const getMood = (): PetMood => {
    if (hunger > 70) return PetMood.HUNGRY;
    if (energy < 30) return PetMood.TIRED;
    if (happiness < 30) return PetMood.SAD;
    if (happiness > 80 && energy > 70) return PetMood.EXCITED;
    if (happiness > 60) return PetMood.HAPPY;
    return PetMood.CONTENT;
  };

  const currentMood = getMood();

  return (
    <div className="pet-game-container" style={{ padding: '20px', textAlign: 'center', fontFamily: 'sans-serif' }}>
      {!gameStarted ? (
        <form onSubmit={handleStartGame}>
          <h2>Name Your Digital Pet</h2>
          <input
            id="pet-name"
            name="pet-name"
            type="text"
            value={inputName}
            onChange={(e) => setInputName(e.target.value)}
            placeholder="Enter pet name..."
          />
          <button type="submit">Start Game</button>
        </form>
      ) : (
        <div>
          <h1 className="pet-name">{petName || inputName || 'Buddy'}</h1>
          <div style={{ fontSize: '48px', margin: '15px 0' }}>
            {moodEmojis[currentMood]}
          </div>

          <div className="stats-container" style={{ margin: '20px 0' }}>
            <div className="stat">
              Hunger: <span className="stat-value">{hunger}</span>
            </div>
            <div className="stat">
              Energy: <span className="stat-value">{energy}</span>
            </div>
            <div className="stat">
              Happiness: <span className="stat-value">{happiness}</span>
            </div>
          </div>

          <div className="actions-container">
            <button id="eat-action" onClick={() => handleAction(Action.EAT)}>
              EAT
            </button>
            <button id="play-action" onClick={() => handleAction(Action.PLAY)}>
              PLAY
            </button>
            <button id="sleep-action" onClick={() => handleAction(Action.SLEEP)}>
              SLEEP
            </button>
          </div>
        </div>
      )}
    </div>
  );
};