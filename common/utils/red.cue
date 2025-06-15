// Red-DiscordBot Cog metadata file
package red

import (
	"list"
	"net"
)

#info: {
	@jsonschema(schema="http://json-schema.org/draft-07/schema#")
	@jsonschema(id="https://raw.githubusercontent.com/Cog-Creators/Red-DiscordBot/V3/develop/schema/red_cog.schema.json")
	author?: [...string]
	description?:             string
	install_msg?:             string
	short?:                   string
	end_user_data_statement?: string
	min_bot_version?:         =~"^(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)((a|b|rc)(0|[1-9][0-9]*))?(\\.post(0|[1-9][0-9]*))?(\\.dev(0|[1-9][0-9]*))?$"
	max_bot_version?:         =~"^(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)((a|b|rc)(0|[1-9][0-9]*))?(\\.post(0|[1-9][0-9]*))?(\\.dev(0|[1-9][0-9]*))?$"
	min_python_version?: list.MaxItems(3) & [_, _, _, ...] & [...int]
	hidden?:        bool
	disabled?:      bool
	required_cogs?: #required_cog
	requirements?: [...string]
	tags?: list.UniqueItems() & [...string]
	type?: "COG" | "SHARED_LIBRARY"
	#required_cog: close({
		{[=~".+"]: net.AbsURL}
	})
	...
}

#repo: {
	@jsonschema(schema="http://json-schema.org/draft-07/schema#")
	@jsonschema(id="https://raw.githubusercontent.com/Cog-Creators/Red-DiscordBot/V3/develop/schema/red_cog_repo.schema.json")
	author?: [...string]
	description?: string
	install_msg?: string
	short?:       string
	...
}
