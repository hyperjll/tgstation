import { Antagonist, Category } from '../base';

const ClockCultist: Antagonist = {
  key: 'clockcultist',
  name: 'Clock Cultist',
  description: [
    `
      You are one of the last remaining servants of
      Rat'var, The Clockwork Justicar.
      After a long and destructive war, Rat'Var was imprisoned
      inside a dimension of suffering.
      You must free him by protecting The Ark so that his light may
      shine again.
    `,

    `
      Gather power by putting Integration Cogs inside APCs
      and fortify Reebe and The Ark aganist the crew's assault
      long enough for it to open.
    `,
  ],
  category: Category.Roundstart,
};

export default ClockCultist;
