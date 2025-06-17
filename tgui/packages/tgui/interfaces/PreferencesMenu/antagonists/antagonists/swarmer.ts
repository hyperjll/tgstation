import { Antagonist, Category } from '../base';

const Swarmer: Antagonist = {
  key: 'swarmer',
  name: 'Swarmer',
  description: [
    `
      Consume walls, machines, structures and anything else you can to get materials. 
	  Consume, Expand, Repeat.
    `,
  ],
  category: Category.Midround,
};

export default Swarmer;
