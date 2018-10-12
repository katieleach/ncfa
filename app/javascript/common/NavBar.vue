<template>
    <div class="navbar flex flex-v-center">
        <span class="flex flex-v-center navbar__logo">
        Logo
        </span>
        <div class="flex flex-v-center flex-h-end ">
            <span class="navbar__item" v-for="option in navOptions" :key="option.id">
                <nav-bar-dropdown
                    v-if="option.children" 
                    class="navbar-dropdown"
                    v-on:navbar-dropdown-click="selectDropdown(option.id)" 
                    v-on:navbar-dropdown-click-outside="deselectDropdown(option.id)" 
                    :title="option.name"
                    :item="option" 
                    :hasTwoColumns="isTwoColDropdown(option)"
                    :isActive="isActive(option.id)">
                </nav-bar-dropdown>
                <nav-bar-link v-else class="navbar-link" :title="option.name" :item="option"></nav-bar-link>
            </span>
        </div>
    </div>
</template>

<script>
import NavBarDropdown from './NavBarDropdown';
import NavBarLink from './NavBarLink';

export default {
    components: {
        NavBarDropdown,
        NavBarLink
    },
    data: function () {
        return {
            navOptions: [
                {
                    id: 1,
                    name: 'About',
                    children: [
                        {
                            id: 1,
                            name: 'What is AERM?'
                        },
                        {
                            id: 2,
                            name: 'About NCFA'
                        }
                    ]
                },
                {
                    id: 2,
                    name: 'Explore',
                },
                {
                    id: 3,
                    name: 'Data & Methodology',
                    children: [
                        {
                            id: 1,
                            name: 'Methodology'
                        },
                        {
                            id:5,
                            name: 'Sectors'
                        },
                        {
                            id:2,
                            name: 'Data'
                        },
                        {
                            id:6,
                            name: 'Drivers'
                        },
                        {
                            id:3,
                            name: 'Rating'
                        },
                        {
                            id:7,
                            name: 'Assests'
                        },
                        {
                            id:4,
                            name: 'Services'
                        },
                    ]
                },
                {
                    id: 4,
                    name: 'Contact',
                }
            ],
            selectedDropdownId: null
        };
    },
    methods: {
        selectDropdown (id) {
            this.selectedDropdownId = this.selectedDropdownId === id ? null : id;
        },
        deselectDropdown (id) {
            if(this.selectedDropdownId === id) { this.selectedDropdownId = null };
        },
        isActive (id) {
            return id === this.selectedDropdownId;
        },
        isTwoColDropdown(option) {
            return option.children.length > 4;
        }
    } 
}
</script>

