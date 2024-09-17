import { Antagonist, Category } from '../base';

const BrotherInitiate: Antagonist = {
  key: 'brotherinitiate',
  name: 'Brother Initiate',
  description: [
    `
      A form of blood brother that can activate when joining an ongoing shift.
    `,
	
	`
      Team up with other crew members as blood brothers to combine the strengths
      of your departments, break each other out of prison, and overwhelm the
      station.
    `,
  ],
  category: Category.Latejoin,
};

export default BrotherInitiate;
