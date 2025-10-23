import { type Antagonist, Category } from '../base';

export const COMMANDO_MECHANICAL_DESCRIPTION = `
  Arm the provided nuke with your disk or the station's disk
  and protect it at all costs from the crew until it blows up!
`;

const CommandoOperative: Antagonist = {
  key: 'commandooperative',
  name: 'Commando Operative',
  description: [
    `
      Congratulations, agent. You have been chosen to join the Syndicate
      Commando Operative team. Your mission, whether or not you choose
      to accept it, is to shut down Nanotrasen's most advanced research facility!
    `,

    COMMANDO_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Roundstart,
};

export default CommandoOperative;
