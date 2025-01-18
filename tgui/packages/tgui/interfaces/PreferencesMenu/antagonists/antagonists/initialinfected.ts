import { Antagonist, Category } from '../base';

const InitialInfected: Antagonist = {
  key: 'initialinfected',
  name: 'Initial Infected',
  description: [
    `
      You are a romerol smuggler, you've been tasked by the Syndicate with a suicide mission
	  right into the heart of enemy territory. With the chemical implant they've given you,
	  perhaps you'll bring the entire station down with you.
    `,

    `
      Utilize the Romerol you've smuggled aboard to become a zombie and cause havoc.
    `,
  ],
  category: Category.Roundstart,
};

export default InitialInfected;
