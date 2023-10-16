<template>
    <router-link :to="link" class="v-item">
        {{title}}
    </router-link>
</template>

<script>
export default {
    props: {
        link: String,
        title: String
    }
}
</script>

<style scoped>
.v-item {
    border: 2px solid rgb(72, 251, 76);
    padding-left: 10px;
    display: flex;
    align-items: center;
    width: 100%;
    height: 79px;
    text-decoration: none;
    color: #000;
    margin: 20px 0px;
    font-size: 16px;
    cursor: pointer;
    font-size: 22px;
    box-shadow: rgb(72, 251, 76) 0px 4px 0px;
}
</style>