import { Antagonist, Category } from '../base';
import { HERETIC_MECHANICAL_DESCRIPTION } from './heretic';

const HereticAwakening: Antagonist = {
  key: 'hereticawakening',
  name: 'Heretic Awakening',
  description: [
    'A form of heretic that can activate during an ongoing shift.',
    HERETIC_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Midround,
};

export default HereticAwakening;
