Fabricator(:user) do
	name "Sample user"
	provider "twitter"
	uid {Fabricate.sequence(:uid)}
end
