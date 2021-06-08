@php
    const ALL_ASC = 0;
    const ALL_DESC = 1;
    const ROOTS_ASC = 2;
    const ROOTS_DESC = 3;
    const CHILDREN_ASC = 4;
    const CHILDREN_DESC = 5;

    $sortOptions = [
        ALL_ASC=>'all items by name asc',
        ALL_DESC=>'all items by name desc',
        ROOTS_ASC=>'only roots by name asc',
        ROOTS_DESC=>'only roots by name desc',
        CHILDREN_ASC=>'only children by name asc',
        CHILDREN_DESC=>'only children by name desc'
    ];

    $sortOption = Request::get('sort');

    switch ($sortOption) {
        case ALL_ASC:
            $trees = $trees->sortBy('text');
            break;
        case ALL_DESC:
            $trees = $trees->sortByDesc('text');
            break;
        case ROOTS_ASC:
            $trees = $trees->whereNull('parentID')->sortBy('text');
            break;
        case ROOTS_DESC:
            $trees = $trees->whereNull('parentID')->sortByDesc('text');
            break;
    }

@endphp


<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Tree List
        </h2>
    </x-slot>

    <div>
        <div class="max-w-6xl mx-auto py-10 sm:px-6 lg:px-8">

            <div class="block mb-8">
                <a href="{{ route('trees.create') }}" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Add trees</a>

                      <div class=" relative inline-block text-left dropdown ">
                        <span class="rounded-md shadow-sm"
                          ><button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded"
                           type="button" aria-haspopup="true" aria-expanded="true" aria-controls="headlessui-menu-items-100">
                            <span>Sort By</span>
                            </button
                        ></span>
                        <div class="opacity-0 invisible dropdown-menu transition-all duration-300 transform origin-top">
                          <div class="absolute right-0 w-56 mt-2 origin-top-right bg-white border border-gray-200 divide-y rounded-md" aria-labelledby="headlessui-menu-button-1" id="headlessui-menu-items-117" role="menu">
                            <div class="px-3 py-3">
                                @foreach ($sortOptions as $key => $option)
                                <button
                                    onclick="window.location='{{route('trees.index',['trees'=>$trees,'sort'=>$key])}}'">
                                    {{$option}}
                                </button>
                            @endforeach
                            </div>
                        </div>
                      </div>

                    <style>
                    .dropdown:focus-within .dropdown-menu {
                      opacity:1;
                      transform: translate(0) scale(1);
                      visibility: visible;
                    }
                        </style>

            </div>

            <div class="flex flex-col">
                <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                    <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                        <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
                            <table class="min-w-full divide-y divide-gray-200 w-full">
                                <thead>
                                <tr>
                                    <th scope="col" width="50" class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        ID
                                    </th>
                                    <th scope="col" class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        Text
                                    </th>
                                    <th scope="col" width="50" class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        Depth
                                    </th>
                                    <th scope="col" width="200" class="px-6 py-3 bg-gray-50">

                                    </th>
                                </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">


                                @include('trees.subTreeList2',['childs' => $trees])


                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </div>
</x-app-layout>
