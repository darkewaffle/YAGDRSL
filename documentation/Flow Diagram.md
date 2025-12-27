This flowchart represents how 'precast' works but 'midcast' is essentially the exact same process - it just uses a different 'event' name in the paths. Equipping a status set is a similar process but simpler because the paths are basically just 'sets.engaged', 'mods.engaged.modvalue', and so on and so forth. 


But each one ultimately follows the same steps of 'get a set', 'apply the mods', 'apply the override' and 'equip the result'.


```mermaid
flowchart TD;
	A[Character Issues an Action Command] --> B(Find sets.precast...<br>action sets);
	B --> C((sets<br>sets.precast<br>sets.precast.ws<br>sets.precast.ws.melee<br>...<br>...));
	C --> D(Find sets.precast...<br>named sets);
	D --> E((sets.Combo<br>sets.precast.Combo<br>sets.precast.ws.Combo<br>...<br>...)) -->|3b| D;
	D --> F[[Combine<br>action sets + named sets]] --> X[(Complete 'set' gearset)] --> Q;
	F --> G{Are mods active?};
	G --> G1(Yes);
	G --> G2(No) --> K;
	G1 --> G1O(Find mods.precast...<br>for each offense mod value) --> G2O((mods.Acc<br>mods.precast.Acc<br>mods.precast.ws.Acc<br>...<br>...));
	G1 --> G1D(Find mods.precast...<br>for each defense mod value) --> G2D((mods.DT<br>mods.precast.DT<br>mods.precast.ws.DT<br>...<br>...));
	G2O --> G3O[[Combine offense<br>mod sets by mod order]];
	G2D --> G3D[[Combine defense<br>mod sets by mod order]];
	G3O --> I;
	G3D --> I;
	I(Defense Priority?);
	I --> I1(Yes);
	I --> I2(No);
	I1 --> I1D[[Combine<br>offense mod + defense mod]];
	I2 --> I2O[[Combine<br>defense mod + offense mod]];
	I1D --> J;
	I2O --> J;
	J[(Complete 'mod' gearset)] --> K;
	J --> Q;
	K{Is override active?};
	K --> L1(Yes);
	K --> L2(No) --> Q;
	L1 --> M(Find overrides.precast...<br> for override value);
	M --> N((overrides.special<br>overrides.precast.special<br>overrides.precast.ws.special<br>...<br>...));
	N --> O[[Combine override sets]];
	O --> P[(Complete 'override' gearset)];
	P --> Q[[Final combine<br>complete set +<br>complete mod +<br>complete override]];
	Q --> R[Equip the final set];
	R --> S[Start the action];