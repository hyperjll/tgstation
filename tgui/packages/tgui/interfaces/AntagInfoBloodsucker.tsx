import { Box, Button, Divider, Dropdown, Section, Stack, Tabs } from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

import { resolveAsset } from '../assets';
import { useBackend, useLocalState } from '../backend';
import { Window } from '../layouts';

type Objective = {
  count: number;
  name: string;
  explanation: string;
  complete: BooleanLike;
  was_uncompleted: BooleanLike;
  reward: number;
};

type BloodsuckerInformation = {
  clan: ClanInfo[];
  in_clan: BooleanLike;
  power: PowerInfo[];
};

type ClanInfo = {
  clan_name: string;
  clan_description: string;
  clan_icon: string;
};

type PowerInfo = {
  power_name: string;
  power_explanation: string;
  power_icon: string;
};

type Info = {
  objectives: Objective[];
};

const ObjectivePrintout = (props: any) => {
  const { data } = useBackend<Info>();
  const { objectives } = data;
  return (
    <Stack vertical>
      <Stack.Item bold>Your current objectives:</Stack.Item>
      <Stack.Item>
        {(!objectives && 'None!') ||
          objectives.map((objective) => (
            <Stack.Item key={objective.count}>
              #{objective.count}: {objective.explanation}
            </Stack.Item>
          ))}
      </Stack.Item>
    </Stack>
  );
};

export const AntagInfoBloodsucker = (props: any) => {
  const [tab, setTab] = useLocalState('tab', 1);
  return (
    <Window width={620} height={580} theme="spookyconsole">
      <Window.Content>
        <Tabs>
          <Tabs.Tab
            icon="list"
            lineHeight="23px"
            selected={tab === 1}
            onClick={() => setTab(1)}
          >
            Introduction
          </Tabs.Tab>
          <Tabs.Tab
            icon="list"
            lineHeight="23px"
            selected={tab === 2}
            onClick={() => setTab(2)}
          >
            Clan & Powers
          </Tabs.Tab>
        </Tabs>
        {tab === 1 && <BloodsuckerIntro />}
        {tab === 2 && <BloodsuckerClan />}
      </Window.Content>
    </Window>
  );
};

const BloodsuckerIntro = () => {
  return (
    <Stack vertical fill>
      <Stack.Item minHeight="16rem">
        <Section scrollable fill>
          <Stack vertical>
            <Stack.Item textColor="red" fontSize="20px">
              You are a Bloodsucker, an undead blood-seeking monster living
              aboard Space Station 13
            </Stack.Item>
            <Stack.Item>
              <ObjectivePrintout />
            </Stack.Item>
          </Stack>
        </Section>
      </Stack.Item>
      <Stack.Item>
        <Section fill title="Strengths and Weaknesses">
          <Stack vertical>
            <Stack.Item>
              <span>
                You regenerate your health slowly, you are weak to fire, and
                you depend on blood to survive. Dont allow your blood to
                run too low, or you will enter a
              </span>
              <span className={'color-red'}> Frenzy</span>!<br />
              <span>
                Beware of your Humanity level! The more Humanity you lose, the
                easier it is to fall into a{' '}
                <span className={'color-red'}> Frenzy</span>!
              </span>
              <br />
              <span>
                Avoid using your Feed ability while near others, or else you
                will risk <i>breaking the Masquerade</i>!
              </span>
            </Stack.Item>
          </Stack>
        </Section>
      </Stack.Item>
      <Stack.Item>
        <Section fill title="Items">
          <Stack vertical>
            <Stack.Item>
              Rest in a <b>Coffin</b> to claim it, and that area, as your lair.
              Claiming an area grants additional bloodsucker structures in
              structures tab of the crafting menu.
              <br />
              Use your structures to your advantage. Namely, the{' '}
              <b>Persuasion Rack</b> allows you to convert crewmembers into
              loyal thralls. If you are confused about anything your structures
              do, try examining them!
              <br />
              Medical and Genetic Analyzers can sell you out, your Masquerade
              ability will hide your identity to prevent this.
              <br />
            </Stack.Item>
            <Stack.Item>
              <Section textAlign="center" textColor="red" fontSize="20px">
                Other Bloodsuckers are not necessarily your friends, but your
                survival may depend on cooperation. Betray them at your own
                discretion and peril.
              </Section>
            </Stack.Item>
          </Stack>
        </Section>
      </Stack.Item>
    </Stack>
  );
};

const BloodsuckerClan = (props: any) => {
  const { act, data } = useBackend<BloodsuckerInformation>();
  const { clan, in_clan } = data;

  if (!in_clan) {
    return (
      <Section minHeight="220px">
        <Box mt={5} bold textAlign="center" fontSize="40px">
          You are not in a Clan.
        </Box>
        <Box mt={3}>
          <Button
            fluid
            icon="users"
            content="Join Clan"
            textAlign="center"
            fontSize="30px"
            lineHeight={2}
            onClick={() => act('join_clan')}
          />
        </Box>
      </Section>
    );
  }

  return (
    <Stack vertical fill>
      <Stack.Item minHeight="20rem">
        <Section scrollable fill>
          <Stack vertical>
            <Stack.Item>
              {clan.map((ClanInfo) => (
                <>
                  <Box
                    as="img"
                    height="20rem"
                    opacity={0.25}
                    src={resolveAsset(`bloodsucker.${ClanInfo.clan_icon}.png`)}
                    style={{
                      '-ms-interpolation-mode': 'nearest-neighbor',
                      'image-rendering': 'pixelated',
                      position: 'absolute',
                    }}
                  />
                  <Stack.Item fontSize="20px" textAlign="center">
                    You are part of the {ClanInfo.clan_name}
                  </Stack.Item>
                  <Stack.Item fontSize="16px">
                    {ClanInfo.clan_description}
                  </Stack.Item>
                </>
              ))}
            </Stack.Item>
          </Stack>
        </Section>
        <PowerSection />
      </Stack.Item>
    </Stack>
  );
};

const PowerSection = (props: any) => {
  const { act, data } = useBackend<BloodsuckerInformation>();
  const { power } = data;
  if (!power) {
    return <Section minHeight="220px" />;
  }

  const [selectedPower, setSelectedPower] = useLocalState('power', power[0]);

  return (
    <Section
      fill
      scrollable={!!power}
      title="Powers"
      buttons={
        <Button
          icon="info"
          tooltipPosition="left"
          tooltip={
            'Select a Power using the dropdown menu for an in-depth explanation.'
          }
        />
      }
    >
      <Stack>
        <Stack.Item grow>
          <Dropdown
            displayText={selectedPower.power_name}
            selected={selectedPower.power_name}
            width="100%"
            options={power.map((powers) => powers.power_name)}
            onSelected={(powerName: string) =>
              setSelectedPower(
                power.find((p) => p.power_name === powerName) || power[0],
              )
            }
          />
          {selectedPower && (
            <Box
              position="absolute"
              height="12rem"
              as="img"
              src={resolveAsset(`bloodsucker.${selectedPower.power_icon}.png`)}
            />
          )}
          <Divider Vertical />
        </Stack.Item>
        <Stack.Divider />
        <Stack.Item scrollable grow={1} fontSize="16px">
          {selectedPower && selectedPower.power_explanation}
        </Stack.Item>
      </Stack>
    </Section>
  );
};
